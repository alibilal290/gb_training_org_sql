CREATE TABLE [trainer_dim] (
  [trainer_id] INT,
  [first_name] VARCHAR(255),
  [last_name] VARCHAR(255),
  [qualification] VARCHAR(255),
  [contact_no] VARCHAR(255),
  [email] VARCHAR(320),
  PRIMARY KEY ([trainer_id])
);
CREATE TABLE [allocated_students] (
  [student_id] INT,
  [first_name] VARCHAR(255),
  [last_name] VARCHAR(255),
  [contact_no] VARCHAR(255),
  [email] VARCHAR(320),
  [interested_course] VARCHAR(MAX),
  [accomodation_req] VARCHAR(255),
  PRIMARY KEY ([student_id])
);

CREATE TABLE [course_type_dim] (
  [course_type_id] INT,
  [course_title] VARCHAR(MAX),
  [department] VARCHAR(MAX),
  [duration_days] INT,
  PRIMARY KEY ([course_type_id])
);

CREATE TABLE [training_room_dim] (
  [room_no] INT,
  [room_name] VARCHAR(MAX),
  [location] VARCHAR(MAX),
  [max_capacity] INT,
  PRIMARY KEY ([room_no])
);

CREATE TABLE [current_course] (
  [course_id] INT,
  [course_type_id] INT,
  [start_date] DATE,
  [duration_days] INT,
  [trainer_id] INT,
  [room_no] INT,
  PRIMARY KEY ([course_id]),
  CONSTRAINT FK_trainer_id FOREIGN KEY ([trainer_id]) REFERENCES [trainer_dim](trainer_id),
  CONSTRAINT FK_room_no FOREIGN KEY ([room_no]) REFERENCES [training_room_dim](room_no)
);

CREATE TABLE [allocation] (
  [allocation_id] INT,
  PRIMARY KEY (allocation_id),
);






SELECT * FROM allocated_students;
SELECT * FROM trainer_dim;
SELECT * FROM current_course;

DROP TABLE course_type_dim;