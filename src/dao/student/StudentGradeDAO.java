package dao.student;

import entity.student.StudentGrade;

import java.util.List;

public interface StudentGradeDAO {
    public List<StudentGrade> getAll();

    public List<StudentGrade> getAllCourseGrade(Long studentId);

    public void insert(StudentGrade studentGrade);

    public void update(StudentGrade studentGrade);

    public void delete(Long studentId);


    public Integer getCountWithStudentId(Long studentId);

    public List<StudentGrade> getAllWithYearTerm(Long studentId,
                                                 String yearTerm);
}
