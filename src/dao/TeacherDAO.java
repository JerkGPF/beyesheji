package dao;

import entity.Teacher;

import java.util.List;

public interface TeacherDAO {
    public List<Teacher> getAll();

    public Teacher get(String teacherId);

    public void insert(Teacher teacher);

    public void update(Teacher teacher);

    public void delete(String teacherId);

    public long getCountWithName(String teacherId);
}
