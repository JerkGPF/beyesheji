package dao;

import entity.ExamArrange;

import java.util.List;

public interface ExamArrangeDAO {
    public List<ExamArrange> getAll();

    public List<ExamArrange> getAllWithStudentId(String studentId);

    public void insert(ExamArrange examArrange);

    public void update(ExamArrange examArrange);

    public void delete(String studentId);


    public long getCountWithName(String studentId);

    public List<ExamArrange> getAllWithYearTerm(String studentId,
                                                String yearTerm);
}