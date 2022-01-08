--   -- Script name: tests.sql
   -- Author:      Jonathan McGrath
   -- Purpose:     To test the integrity of the Database
   
   -- Testing the Database with DELETE and UPDATE
   USE colab_db; 
   
  
    -- 1. Institution Table UPDATE / DELETE
	DELETE FROM Institution WHERE state = 'Florida';
    -- 2. Principal Table UPDATE / DELETE
   DELETE FROM Principal WHERE principal_id = 200;
   UPDATE Principal SET institution = 511 WHERE principal_id = 202;
	-- 3. Student Table UPDATE / DELETE
	DELETE FROM Student WHERE name = "Gregory";
	UPDATE Student SET student_id = 9 WHERE name = "Jonathan";
    
	-- 4. Teacher TableUPDATE / DELETE
	-- ERROR DELETE FROM Teacher WHERE teacher_id = 21; 
	UPDATE Teacher SET name = 'Lizz' WHERE teacher_id = 22;
    
    -- 5. Department Table UPDATE / DELETE
    DELETE FROM Department WHERE size = 10;
	UPDATE Department SET name = "Lab Science" WHERE name = 'Science';
	
    -- 6. Coach Table UPDATE / DELETE
	--  ERROR -- Cannot delete or update parent row 
    --  DELETE FROM Coach WHERE name = 'Henry';
    
	UPDATE Coach SET name = 'Stweard' where coach_id = 401;
	
	
    -- 7. Counselor Table UPDATE / DELETE
	DELETE FROM Counselor WHERE name = 'Rancher Bob';
	UPDATE Counselor SET name = 'Barby Walters' WHERE counselor_id = 700;
	
    -- 8. Book Table UPDATE / DELETE
	DELETE FROM Book WHERE title = 'The Earth';
	UPDATE Book SET edition = 2 WHERE id = 2091;
	
    -- 9. Course Table UPDATE / DELETE; 
	DELETE FROM Course WHERE name = 'Rocks of Florida';
	UPDATE Course SET book = 2091 WHERE course_id = 1000;
    
    -- 10. Lesson Table UPDATE / DELETE
    DELETE FROM Lesson WHERE lesson_id = 501;
	UPDATE Lesson SET course = 1001 WHERE lesson_id = 500;
    
    -- 11. Module Table UPDATE / DELETE
	DELETE FROM Module WHERE lesson = 500;
	UPDATE Module SET lesson = 500 WHERE module_id = 552;
    
    -- 12. Test Table UPDATE / DELETE
    DELETE FROM Test WHERE student = 1;
	UPDATE Test SET date = '2021-09-14' WHERE student = 2;
	
    -- 13. Homework Table UPDATE / DELETE
    DELETE FROM Homework WHERE student = 1;
	UPDATE Homework SET grade = 100 WHERE student = 2;
	
    -- 14.  Certificate Table UPDATE / DELETE
    DELETE FROM Certificate WHERE certificate_id = 5001;
	UPDATE Certificate SET course = 1001 WHERE certificate_id = 5000;
	
    -- 15. Report Table UPDATE / DELETE
    DELETE FROM Report WHERE counselor = 701;
	UPDATE Report SET report_details = "Way better Report" WHERE counselor = 700;
	
    -- 16. Student Report Table UPDATE / DELETE
    DELETE FROM Student_report WHERE student_report_id = 2;
	UPDATE Student_report SET report_contents = "Better Report" where student_report_id = 1;
	
    -- 17. Teacher Report Table UPDATE / DELETE
    DELETE FROM Teacher_report WHERE name = 'Jocy';
	UPDATE Teacher_report SET number_of_courses = 8 WHERE teacher_report_id = 21;
	
    -- 18. Coach Report Table UPDATE / DELETE
    DELETE FROM Coach_report WHERE coach_report_id = 400;
	UPDATE Coach_report SET rating = 10 WHERE coach_report_id = 402;
    
    -- 19. Class Table UPDATE / DELETE
    DELETE FROM Class WHERE class_id = 60;
	UPDATE Class SET course = 1000 WHERE class_id = 61;
   
   
    -- 21. Class Locations Table UPDATE / DELETE
    UPDATE Class_locations SET roomnumber = 240 WHERE class_locations_id = 61;
    DELETE FROM Class_locations WHERE class_locations_id = 61;
	   
   -- 22. Tutors Table UPDATE / DELETE
    DELETE FROM Tutors where tutor_id = 1;
	UPDATE Tutors SET sessions = 90 WHERE tutor_id = 2; 
	
    -- 20. Map Table UPDATE / DELETE
    DELETE FROM Map where map_id = 805;
    UPDATE Map SET num_classes = 9 WHERE map_id = 807;
    
    -- 23. Students UPDATE / DELETE
    -- ERROR Table is not allowing data injection. TroubleShooting
   -- DELETE FROM 
   -- UPDATE