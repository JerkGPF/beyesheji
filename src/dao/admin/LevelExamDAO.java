package dao.admin;

import entity.admin.LevelExam;

import java.util.List;

public interface LevelExamDAO {
    public List<LevelExam> getAll();

    public LevelExam get(String courseId);

    public LevelExam get(String courseId, String yearTerm);

    public void insert(LevelExam levelExam);

    public void update(LevelExam levelExam);

    public void delete(String courseId);

    /**
     * 返回和courseId相等的记录数
     * @param courseId
     * @return
     */
    public long getCountWithName(String courseId);

    /**
     * 返回和yearTerm相等的记录
     * @param yearTerm
     * @return
     */
    public List<LevelExam> getAllWithYearTerm(String yearTerm);
}
