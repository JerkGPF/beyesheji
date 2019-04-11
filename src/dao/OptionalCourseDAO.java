package dao;

import entity.OptionalCourse;

import java.util.List;

public interface OptionalCourseDAO {
    public List<OptionalCourse> getAll();

    public OptionalCourse get(String courseId);

    public OptionalCourse get(String courseId, String yearTerm);

    public void insert(OptionalCourse optionalCourse);

    public void update(OptionalCourse optionalCourse);

    public void delete(String courseId);


    public long getCountWithName(String courseId);


    public List<OptionalCourse> getAllWithYearTerm(String yearTerm);
}