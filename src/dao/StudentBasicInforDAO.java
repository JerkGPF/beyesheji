package dao;

import entity.CriterStudent;
import entity.StudentBasicInformation;

import java.util.List;

public interface StudentBasicInforDAO {
    public List<StudentBasicInformation> getAll();

    public StudentBasicInformation get(Long studentId);

    public void insert(StudentBasicInformation studentBasicInfor);

    public void update(StudentBasicInformation studentBasicInfor);

    public void delete(Long studentId);

    public Integer getCountWithStudentId(Long studentId);


    public List<StudentBasicInformation> getForListWithCriterStudent(CriterStudent student);
}
