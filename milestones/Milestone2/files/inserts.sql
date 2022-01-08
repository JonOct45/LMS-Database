--   -- Script name: inserts.sql
   -- Author:      Jonathan McGrath
   -- Purpose:     This is the insert file for the database. 
   
   -- the database used to insert the data into.
   USE colab_db; 
   
   
    -- 1. Institution Table Inserts
	INSERT INTO institution(id, name, state, address) 
    VALUES 
    (509, 'SamSam College', 'California', '1243 Street'), (510, 'Jonathan School', 'Florida', '1236 Way'), 
    (511, 'School of What', 'California', '324 Way'), (512, "Mountain School", "Ohio", "1232 Street"), (513, "Boating School", "North Carolina", "Something Street"), 
    (514, "School of Kiting", "Texas", " 242 Yeehaw street"), (515, "School of Agriculture", "Texas", "242 Yeehaw");
   
    -- 2. Principal Table Inserts
	INSERT INTO principal(id, name, institution) 
    VALUES (200, 'Jolly Ray', 512),(201, 'Rovvo', 510),(202, 'George', 511);
   
	-- 3. Student Table Inserts
	INSERT INTO student(id, name, age, degree) 
    VALUES (1, 'Jonathan McGrath', 19 , 'Law'), (2, 'Jennifer MeGrach', 19, 'Science'), (3, 'Gregory Robo',  23, 'History'), 
    (4, 'Jordan Roberts', 28, 'Art'), (5, 'Mark Doi', 100, 'Politics'), (6, 'Ricardo Mori', 21, 'Engineering'), 
    (7, 'Alain Ross', 20, 'History'), (8, 'Kim Becker', 24, 'Computer Science'), (9, 'Steph Hagn', 28, 'Computer Science'), 
    (10, 'Kelly Margod', 25, 'Computer Science'), (11, 'Jose Gustov', 24, 'Media'), (12, 'Jesse Kraw', 22, 'History'), 
    (13, 'Yael Romo', 19, 'Photography'), (14, 'Bob Mak', 22, 'Liberal Arts'), (15, 'Jenn Huddy', 20, 'Rocks');
    
    -- 4. Department Table Inserts
    INSERT INTO department(id, name, size) 
    VALUES 
    (600, 'Art', 10), (601, 'Science', 20), (602, 'History', 15),
    (603, 'Computer Science', 15), (604, 'Geology', 20), (605, 'Engineering', 8);
    
	-- 5. Teacher Table Inserts
	INSERT INTO teacher(id, name, department,num_of_reports) 
    VALUES 
    (20, 'Robert', 600, 0), (21, 'Megan', 600, 0), (22, 'Ali', NULL,0),
    (23, 'Marilyn Mer', 602, 0), (24, 'Richard McG', 604, 10), (25, 'Marion Hix', 602, 4),
    (26, 'Roe Grade', 604, 7), (27, 'Greg Hagn', 604, 9);
  
   
	-- 6. Coach Table Inserts
	INSERT INTO coach(id, name, principal, rating, num_of_reports) 
    VALUES 
    (400, 'Jonathan G', 200, 9, 10), (401, 'Robert Bloo', 200, 7, 7), (402, 'Henry', 202, 10, 4), 
    (403, 'Genine Riviera', 201, 4, 9), (404, 'Chris Robbie', 200, 6, 10), (405, 'Rizzo Lizzy', 202, 10, 16);
   
	-- 7. Counselor Table Inserts
	INSERT INTO counselor(id, name, num_of_reports) 
    VALUES (700, 'Jeremy Roll', 19), (701, 'Hilda Roya', 19), (702, 'Rancher Bob', 34), (703, "Rebothr Hhgra", 45);
   
	-- 8. Book Table Inserts
	INSERT INTO book(id, title, book_type, edition) 
    VALUES 
    (2090, 'The Earth', 'Geography', 9), (2091, 'Physical Stuff', 'Physics', 1), 
    (2092, 'Art around the planet', 'Art', 3), (2093, 'Local Museums', 'History', 1), 
    (2094, 'Local Museums', 'History', 5), (2095, 'Data Structures', 'Computer Science', 4), 
    (2096, 'Data Entry', 'Computer Science', 11);
    
	-- 9. Course Table Inserts
	INSERT INTO course(id, name, course_subject, book) 
    VALUES 
    (1000, 'Art from France', 'Art', 2092), (1001, 'Magnets and Such', 'Physics', 2091), 
    (1002, 'Rocks of Florida', 'Geography', 2090), (1003, 'San Francisco Museums', 'Art',2094),
    (1004, 'Computer Software', 'Computer Science', 2095), (1005, 'Data Strutures and Stuff', 'Computer Science', 2095),
    (1006, 'Computer Language','Computer Science', 2096); 
   
    -- 10. Lesson Table Inserts
	INSERT INTO lesson(id,course, lesson_title) 
    VALUES 
    (500, 1000, '1450 ART'), (501, 1001, 'Electricism'), (502, 1001, 'Magnetic art'), (503, 1006, "Language Principals"),
    (504, 1006, "More Languages"), (505, 1005, "Objects");
    
    -- 11. Module Table Inserts
	INSERT INTO module(id, start_date, contents, lesson, course) 
    VALUES (550,'2021-10-10', 'Stuff inside', 500, 1000), (551,'2021-10-10', 'Stuff outside', 501, 1001), 
    (552,'2021-10-10', 'Stuff On the Mood', 502, 1002), (553, "2020-10-10", "Data Science", 505, 1005), 
    (554, "2020-09-08", "Algorithms", 505, 1002);
   
    -- 12. Test Table Inserts
    INSERT INTO test(id, title, date, module, student, grade) 
    VALUES 
    (800, 'Moon Test', '2021-11-05', 550, 1, 99), (801, 'Magnet Test', '2021-04-06', 552, 2, 87), (803, 'Art Test', '2021-07-14', 551, 3, 93),
    (802, "Algo Test", '2020-08-14', 554, 14, 84), (804, "Light Test", "2021-10-01", 552,8, 79), (805, "Math Test", "2000-07-23", 551, 6, 99), 
    (806, "Comp Test", "2020-10-05", 554, 14, 67), (808, "Data Test", "2020-03-01", 554, 14, 99), (807, "Lit Test", "2021-05-10", 552, 8, 55);
    
	-- 13. Homework Table Inserts
	INSERT INTO homework(id, name, grade, module, student) 
    VALUES 
    (9000, 'Astro HW', 90, 552, 3), (9001, 'Magnet HW', 95, 552, 2), (9002, 'Africa Art', 88, 550, 1);
    
	-- 14.  Certificate Table Inserts
	INSERT INTO certificate(id, name, date_issued, course, student) 
    VALUES 
    (5000,'Jonathan','2019-10-10', 1006, 1), (5001, 'Jenny', '2020-08-09', 1005, 2), (5002, 'Greg', '2019-02-14', 1002, 3);
    
	-- 15. Report Table Inserts
    INSERT INTO report(id, counselor, report_details, name) 
    VALUES 
    (4500, 700, "Good Report", 'Robert'), (4501, 701, "Alright Report", 'Jennifer'), (4502, 702, "Ok Report", 'Joshua'), 
    (4503, 700, "Decent Report", "Robert Andrew"), (4504, 702, "Splendid", "Gregory"), (4505, 703, "Awesome Report", "Jennifer Conno");
    
	-- 16. Student Report Table Inserts
	INSERT INTO student_report(id, name, report_contents, report) 
    VALUES 
    (1,'Jonathan', 'Good Report', 4500), (2, 'Jesse', "Ok Report", 4502), (3, 'George', "Final Report", 4502), (4, "Rebecca", "New Report", 4505), 
    (5, "Steven", "Super Report", 4501), (6, "Jasper", "Decent Report", 4500), (7, "Sam", "Report on Stuff", 4502), (8, "Jocy", "Somewhat Reported", 4503), 
    (14, "Henry", "Somewhat Report", 4505), (10, "Ughoa", "Something Reported", 4504), (11, "Sampson", "This Report", 4505);
    
	-- 17. Teacher Report Table Inserts
	INSERT INTO teacher_report(id, name, course, number_of_courses, report) 
    VALUES 
    (20, 'Jocy', 'Art', 10, 4500), (21, 'Jenivie', 'Geo', 18, 4500), (21, 'Herb', 'Astrology', 14, 4501);
    
	-- 18. Coach Report Table Inserts
	INSERT INTO coach_report(id, contents, rating, report) 
    VALUES (400, "Good Report", 9.0, 4500), (401, "Awesome Report", 10.0, 4500), (402, "Sweet Report", 8.9, 4502);
    
    -- 19. Class Table Inserts
    INSERT INTO class(id, teacher, students, contents, topic, course, created_by) 
    VALUES 
    (60, 20,15, "Hello Class", 'Art Media', 1000, 400), (61, 21, 50, "Learning about Boats", "Ocean", 1002, 402), 
    (62, 22, 22, "Stuff in Earth", "Ground", 1001, 401), (63, 23, 34, "Computer Art", 'Art Media', 1006, 404), 
    (64, 21, 40, "Art of Ocena", "Global Art", 1004, 403), (65, 22, 35, "Computer Ages and data", "Computer Aging", 1005, 404), 
    (66, 27, 10, "Social Constructs", "Media", 1003, 402);
    
    
    -- 20. Map Table Inserts
    INSERT INTO map(id, name, num_classes, institution) 
    VALUES 
    (805, "West Map", 18, 510), (806, "East Map", 13, 510), (807, "North Map", 20, 509),(808, "Central Area", 15, 511);
    
    -- 21. Class Locations Table Inserts
	INSERT INTO class_locations(id, map, roomnumber, building) 
    VALUES 
    (61, 805, 200, "Mark Hall"),(60, 805, 203, "Ricky Hall"),
     (62, 806, 195, "Barbara Fore Building"), 
    (65, 807, 45, "Fishers Mark Room"), (63, 807, 156, "The Dungeon"), (64, 808, 1006, "Gerny Way"), (66, 807, 785, "Sampsom Hall");
    

    -- 22. Tutors Table Inserts
    INSERT INTO tutors(id, sessions, topic, student) 
    VALUES 
    (2, 20, "Art of War", 3),(5, 3, 'Business', 6 ), (3, 4, 'Shoes', 8), 
    (4, 15, "Data Structures", 7), (7, 10, "Algorithms", 10), (15, 10, "HealthCare", 14),
    (6, 10, "Algos", 14), (10, 10, "Literature", 8), (11, 9, "Math", 14),(1, 5, "Whatver", 5), 
    (13, 15, "Math", 4), (8, 12, "Art History", 7);
    


    
    
    -- 23. Class of Students Table
	-- ERROR WITH STUDENTS TABLE
		INSERT INTO students(id, student, class,attendance) 
        VALUES (750, 1, 60, 1), (751, 2, 61, 1), (752, 3, 61, 1), (753, 4, 60, 1), (754, 5, 61, 1),
        (755, 6, 61, 1), (756, 7, 64, 1), (757, 8, 61, 1), (758, 9, 65, 1), (759, 10, 61, 1), (760, 11, 62, 1),
        (761, 12, 63, 1), (762, 13, 65, 1), (763, 14, 61, 1), (764, 15, 64, 1), (765, 1, 61, 1), (766, 2, 60, 1);