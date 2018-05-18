CREATE VIEW user_all_study_time
AS SELECT user_id, user.name AS user_name, sum(study_time) AS all_study_time
FROM usercourse, user WHERE user_id=user.id
GROUP BY user_id
ORDER BY all_study_time ASC;


CREATE VIEW course_statistics
AS SELECT course.name AS course_name, count(usercourse.user_id) AS user_count, sum(study_time) AS all_study_time
FROM course, usercourse WHERE course_id=course.id
GROUP BY course_id
ORDER BY all_study_time DESC;
