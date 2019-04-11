package dao;

import entity.CourseSchedule;

import java.util.List;

public interface CourseScheduleDAO {
    public List<CourseSchedule> getAll();

    public CourseSchedule get(String studentId);

    public void insert(CourseSchedule courseSchedule);

    public void update(CourseSchedule courseSchedule);

    public void delete(String studentId);


    public long getCountWithName(String studentId);

    public List<CourseSchedule> getAllWithYearTerm(String studentId,
                                                   String yearTerm, String week);
}
