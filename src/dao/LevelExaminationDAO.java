package dao;

import entity.LevelExamination;

import java.util.List;

public interface LevelExaminationDAO {

    public List<LevelExamination> getAllWithYearTerm(String studentId, String yearTerm);

    public List<LevelExamination> getAllLevelWithStudentId(String studentId);

    public void insert(LevelExamination levalExamination);

    public void update(LevelExamination levalExamination);

    public void delete(Long studentId);


    public Integer getCountWithStudentId(Long studentId);
}
