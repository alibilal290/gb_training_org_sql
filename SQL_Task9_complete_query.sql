

CREATE VIEW v_total_revenue
AS 
SELECT
    ccs.course_id AS 'Course Code',
    ccs.start_date AS 'Run Date',
    crd.course_fee_with_accommodation,
    crd.course_fee_without_accommodation,
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

GO
;

CREATE PROCEDURE sp_revenue
AS 
BEGIN
SELECT 
    [Run Date],
    [Course Code],
    COUNT([No. of Students]) AS total_students,
    sum(Revenue) as Revenue
FROM v_total_revenue
GROUP BY
    [Run Date],
    [Course Code]
ORDER BY [Run Date]
END
GO
;

EXEC sp_revenue;


SELECT
    ast.accomodation_req,
    ctd.course_fee_with_accommodation,

    ctd.course_fee_with_accommodation * COUNT(alc.allocation_code) AS 'Revenue'
FROM 
    current_course AS ccs 
    INNER JOIN allocation as alc 
        ON alc.batch_id = ccs.batch_id
    INNER JOIN allocated_student AS ast 
        ON ast.student_id = alc.student_id
    INNER JOIN course_type_dim AS ctd 
        ON ctd.course_id = ccs.course_id

WHERE ast.accomodation_req = 'Yes'
GROUP BY
    ast.accomodation_req,
    ctd.course_fee_with_accommodation
;



SELECT
    current_course.batch_id,
    COUNT(allocation.student_id) AS 'Students'
FROM current_course
    INNER JOIN allocation
        ON allocation.batch_id = current_course.batch_id
WHERE
    allocation.batch_id = 305
GROUP BY 
    current_course.batch_id
ORDER BY current_course.batch_id ASC
;

--------------
--------------

SELECT
    ccs.course_id AS 'Course Code',
    ccs.start_date AS 'Run Date',
    crd.course_fee_with_acc AS 'Course Fee',
    COUNT(alc.student_id) AS 'No. of Students',
    crd.course_fee_with_acc * COUNT(alc.allocation_code) AS 'Revenue'
FROM 
    current_course AS ccs 
    LEFT JOIN course_type_dim AS crd
        ON crd.course_id = ccs.course_id
    INNER JOIN allocation AS alc 
        ON alc.batch_id = ccs.batch_id
GROUP BY
    ccs.course_id, 
    ccs.start_date, 
    crd.course_fee_with_acc
;