INSERT INTO [course_type_dim] ([course_id], [course_title], [duration_days], [course_fee_without_accommodation], [course_fee_with_accommodation])
VALUES
  ('CIMW','Introduction to Microsoft Word', 3, 150, 210),
  ('CIMX','Introduction to Microsoft Excel', 3, 170, 230),
  ('CAMW','Advanced Level Microsoft Word', 5, 300, 400),
  ('CAMX','Advanced Level Microsoft Excel', 5, 330, 430),
  ('CIMP','Introduction to Microsoft PowerPoint', 1, 60, 80),
  ('CAMP','Advanced Level Microsoft PowerPoint', 5, 250, 330)
  ;
  
INSERT INTO trainer_dim (first_name, last_name, qualification, course_teach, contact_no, email)
VALUES
  ('John', 'Doe', 'Microsoft Office Specialist ','CIMW', '123-456-7890', 'john.doe@email.com'),
  ('Jane', 'Smith', 'PowerBI Specialist','CIMX', '987-654-3210', 'jane.smith@email.com'),
  ('Chris', 'Johnson', 'Microsoft Office Specialist','CAMX',  '555-123-4567', 'chris.johnson@email.com'),
  ('Emily', 'Brown', 'Masters in Data Science','CIMP', '444-555-6666', 'emily.brown@email.com'),
  ('Olivia', 'Wang', 'Bacholars in Computer Science','CAMP', '333-444-5555', 'olivia.wang@email.com'),
  ('David', 'Kim', 'Microsoft Office Specialist ','CAMW', '222-333-4444', 'david.kim@email.com')
  ;

INSERT INTO allocated_student (first_name, last_name, contact_no, email, interested_course, accomodation_req, boarding_house_name)
VALUES
  ('Alice', 'Smith', '111-222-3333', 'alice.smith@email.com', 'CIMW', 'Yes', 'Serene Haven Boarding House'),
  ('Bob', 'Johnson', '444-555-6666', 'bob.johnson@email.com', 'CIMX', 'No','None'),
  ('Charlie', 'Brown', '777-888-9999', 'charlie.brown@email.com', 'CIMX', 'Yes', 'Serene Haven Boarding House'),
  ('Diana', 'Miller', '222-333-4444', 'diana.miller@email.com', 'CIMW', 'No','None'),
  ('Eric', 'Lee', '555-666-7777', 'eric.lee@email.com', 'CIMP', 'Yes', 'Serene Haven Boarding House'),
  ('Fiona', 'Wang', '888-999-0000', 'fiona.wang@email.com', 'CIMP', 'No','None'),
  ('George', 'Davis', '333-444-5555', 'george.davis@email.com', 'CIMW', 'Yes', 'Serene Haven Boarding House'),
  ('Holly', 'Garcia', '666-777-8888', 'holly.garcia@email.com', 'CIMX', 'No','None'),
  ('Ian', 'Martinez', '999-000-1111', 'ian.martinez@email.com', 'CIMP', 'Yes', 'Serene Haven Boarding House'),
  ('Jack', 'Lopez', '444-555-6666', 'jack.lopez@email.com', 'CIMW', 'No','None'),
  ('Zoe', 'Chen', '123-456-7890', 'zoe.chen@email.com', 'CIMP', 'Yes', 'Serene Haven Boarding House'),
  ('Aaron', 'Wu', '987-654-3210', 'aaron.wu@email.com', 'CAMP', 'No','None'),
  ('Emily', 'Kim', '555-123-4567', 'emily.kim@email.com', 'CAMP', 'Yes', 'Serene Haven Boarding House'),
  ('Max', 'Nguyen', '333-555-7777', 'max.nguyen@email.com', 'CAMP', 'No','None'),
  ('Sophia', 'Taylor', '666-999-3333', 'sophia.taylor@email.com', 'CIMW', 'Yes', 'Serene Haven Boarding House'),
  ('Daniel', 'Hernandez', '222-444-8888', 'daniel.hernandez@email.com', 'CAMP', 'No','None'),
  ('Olivia', 'Garcia', '888-555-1111', 'olivia.garcia@email.com', 'CAMP', 'Yes', 'Serene Haven Boarding House'),
  ('Liam', 'Lee', '111-999-6666', 'liam.lee@email.com', 'DSAA', 'No','None'),
  ('Ava', 'Nguyen', '444-333-7777', 'ava.nguyen@email.com', 'CIMW', 'Yes', 'Serene Haven Boarding House'),
  ('Noah', 'Smith', '777-222-5555', 'noah.smith@email.com', 'DSAA', 'No','None'),
  ('Emma', 'Wang', '999-666-3333', 'emma.wang@email.com', 'CAMP', 'Yes', 'Serene Haven Boarding House'),
  ('Mia', 'Davis', '555-333-1111', 'mia.davis@email.com', 'CIMW', 'No','None'),
  ('Ethan', 'Garcia', '111-777-4444', 'ethan.garcia@email.com', 'CIMP', 'Yes', 'Serene Haven Boarding House'),
  ('Aria', 'Jones', '777-444-1111', 'aria.jones@email.com', 'CAMX', 'No','None'),
  ('James', 'Brown', '222-777-4444', 'james.brown@email.com', 'CAMX', 'Yes', 'Serene Haven Boarding House'),
  ('Avery', 'Lopez', '777-222-1111', 'avery.lopez@email.com', 'CIMW', 'No','None'),
  ('Grace', 'Miller', '222-777-4444', 'grace.miller@email.com', 'CIMX', 'Yes', 'Serene Haven Boarding House'),
  ('Leo', 'Smith', '777-444-1111', 'leo.smith@email.com', 'CIMX', 'No','None'),
  ('Luna', 'Chen', '222-111-4444', 'luna.chen@email.com', 'CIMW', 'Yes', 'Serene Haven Boarding House'),
  ('Isaac', 'Wang', '111-444-7777', 'isaac.wang@email.com', 'CIMW', 'No','None'),
  ('Hazel', 'Lopez', '444-111-7777', 'hazel.lopez@email.com', 'CIMX', 'Yes', 'Pinecrest Residences'),
  ('Logan', 'Martinez', '777-444-1111', 'logan.martinez@email.com', 'CIMW', 'No','None'),
  ('Lucy', 'Nguyen', '444-111-7777', 'lucy.nguyen@email.com', 'CIMW', 'Yes', 'Pinecrest Residences'),
  ('Owen', 'Taylor', '777-111-4444', 'owen.taylor@email.com', 'CAMX', 'No','None'),
  ('Zara', 'Hernandez', '111-777-4444', 'zara.hernandez@email.com', 'CIMP', 'Yes', 'Pinecrest Residences'),
  ('Axel', 'Garcia', '777-111-4444', 'axel.garcia@email.com', 'CAMX', 'No','None'),
  ('Ava', 'Smith', '111-444-7777', 'ava.smith@email.com', 'CAMX', 'Yes', 'Pinecrest Residences'),
  ('Eli', 'Wang', '444-777-1111', 'eli.wang@email.com', 'CAMX', 'No','None'),
  ('Nora', 'Garcia', '777-111-4444', 'nora.garcia@email.com', 'CAMX', 'Yes', 'Pinecrest Residences'),
  ('Mason', 'Brown', '111-444-7777', 'mason.brown@email.com', 'CAMX', 'No','None')
  ;


INSERT INTO [room_dim] ([room_name], [room_type], [location], [max_capacity])
VALUES
('Room 101', 'AV Lecture Room', 'Building A', 20),
('Room 102', 'Non AV Lecture Room', 'Building B', 10),
('Room 103', 'Non AV lecture Room', 'Building C', 20),
('Room 104', 'AV Lecture Room', 'Building A', 20),
('Room 105', 'Training Room', 'Building B', 15)
;

INSERT INTO [current_course] ([course_id], [start_date], [room_no])
VALUES
  ('CIMW', '2023-01-15' , 1),
  ('CIMX', '2023-02-01' , 2),
  ('CAMX', '2023-03-15' , 3),
  ('CIMX', '2023-04-01' , 4),
  ('CAMX', '2023-07-15' , 5),
  ('CIMW', '2023-08-01' , 1),
  ('CAMX', '2023-09-15' , 3),
  ('CIMX', '2023-10-01' , 1),
  ('CIMW', '2023-11-15' , 4),
  ('CIMP', '2023-12-01' , 2)
;

-- Below query will insert data into current_course.end_date and current_course.trainer_id columns using course_id.
-- Since one trainer can teach specific course.
UPDATE cc
SET 
    cc.[end_date] = DATEADD(DAY, td.[duration_days], cc.[start_date]),
    cc.[trainer_id] = tr.[trainer_id]
FROM 
    [current_course] AS cc
    JOIN [course_type_dim] AS td 
        ON cc.[course_id] = td.[course_id]
    JOIN trainer_dim AS tr
        ON tr.[course_teach] = cc.[course_id]
;

INSERT INTO [allocation] ([student_id], [batch_id])
VALUES
 (201,301), 
 (202,301), 
 (203,309), 
 (204,301), 
 (205,301), 
 (206,309), 
 (207,301), 
 (208,309), 
 (209,301), 
 (210,301), 
 (211,302), 
 (212,302), 
 (213,302), 
 (214,310), 
 (215,302), 
 (216,302), 
 (217,310), 
 (218,302), 
 (219,302), 
 (220,302), 
 (221,303), 
 (222,310), 
 (223,310), 
 (224,310), 
 (225,303), 
 (226,304), 
 (227,309), 
 (228,304), 
 (229,304), 
 (230,310), 
 (231,305), 
 (232,306), 
 (233,306), 
 (234,307), 
 (235,307)
;