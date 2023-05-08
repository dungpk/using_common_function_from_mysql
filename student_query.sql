use quanlysinhvien;

INSERT INTO student values(4,'Dung','Hai Duong',010101010101,1,2);
INSERT INTO student values(5,'Hai','Hai Duong',020502060206,1,1);

-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
SELECT address ,COUNT(StudentID) AS 'Số lượng học viên'
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT S.studentName,s.studentID,AVG(Mark)
FROM student S left join Mark M on S.studentID = M.studentID
GROUP BY S.studentName,s.studentID;

--  Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.studentName,s.studentID,AVG(Mark)
FROM student S left join Mark M on S.studentID = M.studentID
GROUP BY S.studentName,s.studentID
HAVING AVG(Mark)>15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.studentName,s.studentID,AVG(Mark)
FROM student S join Mark M on S.studentID = M.studentID
GROUP BY S.studentName,s.studentID
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);


SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId;
