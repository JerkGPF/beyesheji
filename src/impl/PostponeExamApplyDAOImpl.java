package impl;

import dao.DAO;
import dao.PostponeExamApplyDAO;
import entity.PostponeExamApply;

import java.util.List;

public class PostponeExamApplyDAOImpl extends DAO<PostponeExamApply> implements PostponeExamApplyDAO {

    @Override
    public List<PostponeExamApply> getAll() {
        String sql = "SELECT * FROM postponeexamapply;";
        return getForList(sql);
    }

    @Override
    public PostponeExamApply get(String studentId) {
        String sql = "select *from postponeexamapply where studentId = ?";
        return get(sql, studentId);
    }

    @Override
    public void insert(PostponeExamApply postponeExamApply) {
        String sql = "insert into postponeexamapply values(?,?,?,?)";
        update(sql , postponeExamApply.getYearTerm(),postponeExamApply.getStudentId(),
                postponeExamApply.getCourseName(), postponeExamApply.getApplyReason());

    }

    @Override
    public void update(PostponeExamApply postponeExamApply) {

    }

    @Override
    public void delete(String studentId) {
        String sql = "delete from postponeexamapply where studentId = ?";
        update(sql, studentId);
    }


}
