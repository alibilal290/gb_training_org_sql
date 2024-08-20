-- Task 1 --
-- Produce a list of currently running courses by course code then date order.
SELECT 
    course_id AS 'Course Code',
    start_date AS 'Run Date'
FROM 
    current_course
WHERE 
    end_date >= GETDATE() -- Courses that are running on current date.
ORDER BY 
    course_id,
    'Run Date'
;

-- Task 2 --
-- Produce a list of courses that have ‘Introduction’ as part of their title
SELECT 
    course_id AS 'Course Code',
    course_title AS ' Course Title'
FROM
    course_type_dim
WHERE
    course_title LIKE '%Introduction%'
;

-- Task 3 --
-- List the most expensive and the least expensive course that GBT provides. Use sensible headings.
SELECT 
    course_id AS 'Course Code',
    course_title AS ' Course Title',
    duration_days AS 'Course Duration (Days)',
    course_fee_without_accommodation AS 'Course Fee'
FROM
    course_type_dim
WHERE
    course_fee_without_accommodation = (
        SELECT
            MAX(course_fee_without_accommodation) 
        FROM 
            course_type_dim
);

SELECT 
    course_id AS 'Course Code',
    course_title AS ' Course Title',
    duration_days AS 'Course Duration (Days)',
    course_fee_without_accommodation AS 'Course Fee'
FROM 
    course_type_dim
WHERE
    course_fee_without_accommodation = (
        SELECT 
            MIN(course_fee_without_accommodation) 
        FROM course_type_dim
);

-- Task 4 --
-- Produce a list of the number of students on each of the currently allocated courses. 
-- (This should be calculated by the query NOT held as a piece of data)
SELECT
    cd.course_id,
    cd.course_title,
    COUNT(als.student_id) AS total_students
FROM current_course AS cc
    LEFT JOIN allocation AS al 
        ON cc.batch_id = al.batch_id
    INNER JOIN course_type_dim AS cd
        ON cd.course_id = cc.course_id 
    INNER JOIN allocated_student AS als 
        ON al.student_id = als.student_id
GROUP BY 
    cd.course_id, 
    cd.course_title
;

SELECT * FROM current_course;

-- Task 5 --
-- Produce a list of the current courses between two dates. 
-- Make sure you choose dates that provide MEANINGFUL output from your data.

SELECT
    cd.course_id AS 'Course Code',
    cd.course_title AS 'Course Title',
    cc.start_date AS 'Run Date',
    cc.end_date AS 'End Date'
FROM current_course AS cc
    LEFT JOIN course_type_dim AS cd
        ON cc.course_id = cd.course_id
WHERE 
    start_date BETWEEN '2023-09-01' AND '2023-12-31'
ORDER BY 
    cc.start_date
;

-- Task 6 --
-- Produce a list of the number of current courses of each type between two dates.

SELECT
    cc.course_id AS 'Course Code',
    cd.course_title AS 'Course Title',
    COUNT(cc.course_id) AS 'Number of Courses Running'
FROM 
    current_course AS cc
    LEFT JOIN course_type_dim AS cd 
        ON cd.course_id = cc.course_id
WHERE 
    start_date BETWEEN '2023-10-01' AND '2023-12-31'
GROUP BY 
    cc.course_id,
    cd.course_title
ORDER BY 
    cc.course_id
;

-- Task 7 --
-- Produce a list of the rooms (include type of room: e.g av facilities or not) and 
-- trainers (by name) allocated to each course for each week.

SELECT
    rd.room_name AS 'Room Name',
    rd.room_type AS 'Room Type',
    cd.course_title AS 'Course Title',
    td.first_name + ' ' + td.last_name AS 'Trainer Name',
    DATEPART(ISO_WEEK, cc.start_date) AS 'Week Number of Year'
FROM 
    room_dim AS rd
    INNER JOIN current_course AS cc 
        ON rd.room_no = rd.room_no
    INNER JOIN trainer_dim AS td 
        ON cc.trainer_id = td.trainer_id
    INNER JOIN course_type_dim AS cd 
        ON cd.course_id = cc.course_id
WHERE 
    end_date >= GETDATE()
ORDER BY 
    'Room Name'
;

-- Task 8 --
-- Produce a list of students (include student name) currently allocated to an actual course (use your data to select an actual course
-- E.g CIMW starting on 12/11/18)

SELECT
    CONCAT(asd.first_name,' ',asd.last_name) AS "Student Name",
    cdm.course_id AS "Course Code",
    cdm.course_title AS "Course Title",
    ccr.start_date AS 'Course Start Date',
    ccr.end_date AS 'Course End Date'
FROM 
    current_course AS ccr 
    LEFT JOIN allocation AS alc 
        ON ccr.batch_id = alc.batch_id
    INNER JOIN allocated_student as asd 
        ON asd.student_id = alc.student_id
    INNER JOIN course_type_dim AS cdm 
        ON cdm.course_id = ccr.course_id
WHERE
   ccr.end_date >= GETDATE()
ORDER BY 
    'Course Title'
;

-- Task 9 --
-- Produce a list of the current courses together with the total revenue that each course would have/will brought/bring in. 
-- I.e. the number of students on each course multiplied by the number of students taking that course.
SELECT
    ccs.course_id AS 'Course Code',
    ccs.start_date AS 'Run Date',
    crd.course_fee_with_accommodation AS 'Course Fee Inc. Accommodation',
    crd.course_fee_without_accommodation AS 'Course Fee Exc. Accommodation',
    COUNT(alc.student_id) AS 'No. of Students',

CASE 
    WHEN als.accomodation_req = 'No' THEN crd.course_fee_without_accommodation * COUNT(alc.student_id) 
        ELSE 0 
END +
CASE 
    WHEN als.accomodation_req = 'Yes' THEN crd.course_fee_with_accommodation * COUNT(alc.student_id)
        ELSE 0 
END AS 'Revenue'

FROM 
    current_course AS ccs 
    LEFT JOIN course_type_dim AS crd
        ON crd.course_id = ccs.course_id
    INNER JOIN allocation AS alc 
        ON alc.batch_id = ccs.batch_id
    INNER JOIN allocated_student AS als 
        ON als.student_id = alc.student_id
GROUP BY
    ccs.course_id, 
    ccs.start_date,
    als.accomodation_req,
    crd.course_fee_with_accommodation,
    crd.course_fee_without_accommodation
;