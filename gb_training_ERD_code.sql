CREATE TABLE [trainer_dim] (
  [trainer_id] INT IDENTITY(100101,1),
  [first_name] VARCHAR(255) NOT NULL,
  [last_name] VARCHAR(255) NOT NULL,
  [qualification] VARCHAR(MAX) NOT NULL,
  [course_teach] VARCHAR(4) NOT NULL,
  [contact_no] VARCHAR(255) NOT NULL,
  [email] VARCHAR(320) NOT NULL,
  PRIMARY KEY ([trainer_id])
);

CREATE TABLE [allocated_student] (
  [student_id] INT IDENTITY(201,1),
  [first_name] VARCHAR(20) NOT NULL,
  [last_name] VARCHAR(20) NOT NULL,
  [contact_no] VARCHAR(14) NOT NULL,
  [email] VARCHAR(255) NOT NULL,
  [interested_course] VARCHAR(4) NOT NULL,
  [accomodation_req] VARCHAR(3) NOT NULL,
  [boarding_house_name] VARCHAR(255) NOT NULL,
  PRIMARY KEY ([student_id])
);

CREATE TABLE [course_type_dim] (
  [course_id] VARCHAR(4) NOT NULL,
  [course_title] VARCHAR(MAX) NOT NULL,
  [duration_days] INT NOT NULL,
  [course_fee_without_accommodation] INT NOT NULL,
  [course_fee_with_accommodation] INT NOT NULL,
  PRIMARY KEY ([course_id])
);

CREATE TABLE [room_dim] (
  [room_no] INT IDENTITY(1,1),
  [room_name] VARCHAR(MAX) NOT NULL,
  [room_type] VARCHAR(MAX) NOT NULL,
  [location] VARCHAR(MAX) NOT NULL,
  [max_capacity] INT NOT NULL,
  PRIMARY KEY ([room_no])
);

CREATE TABLE [current_course] (
  [batch_id] INT IDENTITY(301,1),
  [course_id] VARCHAR(4),
  [start_date] DATE NOT NULL,
  [end_date] DATE NULL, -- NULL because I will populate data using start_date and course_type.duration_days columns using course_id column.
  [trainer_id] INT NULL, -- NULL because I will populate data using trainer_dim.trainer_id using course_id column
  [room_no] INT NOT NULL,
  PRIMARY KEY ([batch_id]),
  CONSTRAINT FK_course_id FOREIGN KEY ([course_id]) REFERENCES [course_type_dim](course_id),
  CONSTRAINT FK_trainer_id FOREIGN KEY ([trainer_id]) REFERENCES [trainer_dim](trainer_id),
  CONSTRAINT FK_room_no FOREIGN KEY ([room_no]) REFERENCES [room_dim](room_no)
);

CREATE TABLE [allocation] (
  [allocation_code] INT IDENTITY(202301,1),
  [student_id] INT,
  [batch_id] INT,
  PRIMARY KEY (allocation_code),
  CONSTRAINT FK_student_id FOREIGN KEY ([student_id]) REFERENCES [allocated_student](student_id),
  CONSTRAINT FK_batch_id FOREIGN KEY ([batch_id]) REFERENCES [current_course](batch_id)
);