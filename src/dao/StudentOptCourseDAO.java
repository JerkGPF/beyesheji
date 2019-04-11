package dao;

import entity.StudentOptCourse;

import java.util.List;

public interface StudentOptCourseDAO {
    public List<StudentOptCourse> getAll();

    public StudentOptCourse get(String studentId);

    public List<StudentOptCourse> getAll(String studentId);

    public StudentOptCourse get(StudentOptCourse studentOptCourse);

    public void insert(StudentOptCourse studentOptCourse);

    public void update(StudentOptCourse studentOptCourse);

    public void delete(String studentId);


    public long getCountWithName(String studentId);

}
