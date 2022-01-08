
# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable as PT

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']
my_secret = os.environ['DISCORD_TOKEN']

def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here
def get_response(msg): 
  data = msg.split()
  errors = []
  response = None
  command = data[0]
  print(data[0])
  #-------------------------------------------------------------------------
  #QUERY NUMBER 1
  #For each teacher in a X department, find the number of classes they taught that were made #by a coach with Y number of reports.
  if "/teachersearch" in command: 
    # response = "What's up?"
    if len(data) <=1:
      errors.append("You are missing the Department argument")
      response = errors
      print(errors)
    if len(data) <=2:
      errors.append("You're missing the Coach Rating")
      response = errors
     
    else:  
      department = data[1] 
      number = data[2]
      response = business_rule_1(number,department)

#-------------------------------------------------------------------------

  #QUERY NUMBER 2
  #For each Class,  find the average age of students who get tutored and who were part of a #class that was created by a coach with a rating of X to Y

  if "/findcoachcerts" in command: 
    # response = "What's up?"
    if len(data) <=1:
      errors.append("You are missing the Coach Rating argument")
      response = errors
      print(errors)
    if len(data) <=2:
      errors.append("You're missing the Upper Coach Rating")
      response = errors
    else: 
      rating1 = data[1]
      rating2 = data[2]
      response = business_rule_2(rating1, rating2)
  

  #-------------------------------------------------------------------------
  #QUERY NUMBER 3
  if "/bookedition" in command:

    if len(data) <=1:
      errors.append("Missing a Book Edition 1st")
      response = errors
    if len(data) <=2:
      errors.append("Missing the Book Edition 2nd")
      response = errors
      print(errors)
    else:  
      edition1 = data[1] 
      edition2  = data[2]
      response = business_rule_3(edition1, edition2)
#-------------------------------------------------------------------------
  #QUERY NUMBER 4
  if "/avggradeage" in command:
     
    if len(data) <=1:
      errors.append("You are missing the Lower Age")
      response = errors
      print(errors)
    if len(data) <=2:
      errors.append("You're missing the Upper Age Argument")
      response = errors
    else: 
      age1 = data[1]
      age2 = data[2]
      response = business_rule_4(age1, age2)
    
 
#---------------------------------------------------------------------------
  #QUERY NUMBER 5
  #For each counselor, find the number of students that received reports from them which were 
  #tutors for  X students in class larger than Y students.

  if "/counselorreport" in command:
    
    if len(data) <=1:
      errors.append("Missing the Tutor Number")
      response = errors
    if len(data) > 2:
      errors.append("Too much Information")
    else:
      num_of_students  = data[1]
      response = business_rule_5(num_of_students)
      
      
        
  if len(errors) >= 1: 
    return errors
  return response
## ---------------BUSINESS RULE METHODS AND HEADERS ------------------------------------


## Format for the return Tables----
def format_data(headers, rows):
    table = PT()
    table.field_names = headers
    for row in rows:
      table.add_row(row)
    return table



#QUERY NUMBER 1
#For each teacher in a X department, find the number of classes they taught that were made #by a coach with Y number of reports.
def business_rule_1(number, department):
  output = None
  Rows = []
  print(number)
  
  # print(department)
  # departmented = department.capitalize()
  headers = ["Name", "Topic"]
  conn = connect()

  if conn:
    cursor = conn.cursor()

    query = """
    Select teacher.name as name, class.topic as topic
    From class
    JOIN coach on coach.id = class.created_by
    JOIN teacher on teacher.id = class.teacher
    JOIN department on department.id = teacher.department
    WHERE coach.num_of_reports > %s AND department.name = %s
    """
    # tuples = (int(number), str(departmented))
    tuples = (number, department)
    # print(tuples)
    cursor.execute(query, tuples)

    data = cursor.fetchall()
    print(data)
    if data:
      for teacherdata in data:
        row = []
        teacher = teacherdata["name"]
        row.append(teacher)
        classes = teacherdata["topic"]
        row.append(classes)
        Rows.append(row)
      output = format_data(headers, Rows)
   
    if not data:
      output = "No Data Found"
    
    conn.close()
    return output


#QUERY 2
#For each Class,  find the average age of students who get tutored and who were part of a #class that was created by a coach with a rating of X to Y
def business_rule_2(rating1, rating2):
  output = None
  Rows = []

  headers = ["Avg Age", "Class Topic"]
  conn = connect()

  if conn:
    cursor = conn.cursor()

    query = """
    Select Round(AVG(student.age)) as StudentAgeAVG, class.topic as Class
    FROM student
    JOIN students on students.student = student.id
    JOIN class on class.id = students.class
    JOIN tutors on tutors.student = student.id
    JOIN coach on coach.id = class.created_by
    WHERE coach.rating > %s and coach.rating < %s
    Group by(class.topic);
    
    """
    tuples = (rating1,rating2)
    cursor.execute(query, tuples)

    data = cursor.fetchall()
    print(data)
    if data:
      for values in data:
        row = []
        avgage = values["StudentAgeAVG"]
        row.append(avgage)
        classes = values["Class"]
        row.append(classes)
        Rows.append(row)
      output = format_data(headers, Rows)
   
    if not data:
      output = "No Data Found"
    
    conn.close()
    return output



#BUSINESS RULE NUMBER 3
#For each Course, Find books that are between X and Y editions, that were used in a Course in which the Class was taken at an Institution.

def business_rule_3(bookedition1,bookedition2):
  output = None
  Rows = []

  headers = ["Title", "Course"]
  conn = connect()

  if conn:
    cursor = conn.cursor()

    query = """
    Select book.title as bookname, course.name as coursename
    From book
    JOIN course on course.book = book.id
    Where book.edition >= %s and book.edition <=%s;
    
    """
    tuples = (bookedition1,bookedition2)
    cursor.execute(query, tuples)

    data = cursor.fetchall()
    print(data)
    if data:
      for bookdata in data:
        row = []
        book = bookdata["bookname"]
        row.append(book)
        course = bookdata["coursename"]
        row.append(course)
        Rows.append(row)
      output = format_data(headers, Rows)
   
    if not data:
      output = "No Data Found"
    
    conn.close()
    return output

#BUSINESS RULE #4
#For each course, find the average grade on tests from students that are seeing a Tutor #between two ages inclusive.
def business_rule_4(lowage, topage):
  output = None
  Rows = []

  headers = ["Course", "Test_AVG"]
  conn = connect()

  if conn:
    cursor = conn.cursor()

    query = """
  Select course.name as CourseName, avg(test.grade) as Test_AVG
  From course
  JOIN module on module.course = course.id
  JOIN test on test.module = module.id
  JOIN student on student.id = test.student
  JOIN tutors on tutors.student = student.id
  WHERE student.age > %s and student.age < %s
  group by(course.name);
    
    """
    tuples = (lowage,topage)
    cursor.execute(query, tuples)

    data = cursor.fetchall()
    print(data)
    if data:
      for values in data:
        row = []
        course = values["CourseName"]
        row.append(course)
        course = values["Test_AVG"]
        row.append(course)
        Rows.append(row)
      output = format_data(headers, Rows)
   
    if not data:
      output = "No Data Found"
    
    conn.close()
    return output
    

#Query Number 5
#For each counselor, find the number of students that received reports from them which were #tutors for  X students in class larger than Y students.
def business_rule_5(num_of_students):
  output = None
  Rows = []

  headers = ["Counselor", "Students Tutored"]
  conn = connect()

  if conn:
    cursor = conn.cursor()

    query = """
    
    Select counselor.name as Name, count(student_report.name) as Students_Tutored
    From counselor
    join report on report.counselor = counselor.id
    join student_report on student_report.report = report.id
    join students on students.student = student_report.id
    join class on class.id = students.class
    join tutors on tutors.student = student_report.id
    where class.students > %s group by(counselor.name);
    """
    
    cursor.execute(query, num_of_students)

    data = cursor.fetchall()
    print(data)
    if data:
      for value in data:
        row = []
        counselor = value["Name"]
        row.append(counselor)
        students = value["Students_Tutored"]
        row.append(students)
        Rows.append(row)
      output = format_data(headers, Rows)
   
    if not data:
      output = "No Data Found"
    
    conn.close()
    return output

 
  