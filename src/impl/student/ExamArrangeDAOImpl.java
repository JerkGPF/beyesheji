package impl.student;

import dao.DAO;
import dao.student.ExamArrangeDAO;
import entity.student.ExamArrange;

import java.util.List;

public class ExamArrangeDAOImpl extends DAO<ExamArrange> implements ExamArrangeDAO {

    @Override
    public List<ExamArrange> getAll() {
        String sql = "SELECT * FROM examarrange;";
        return getForList(sql);
    }

    @Override
    public List<ExamArrange> getAllWithStudentId(String studentId) {
        String sql = "select *from examarrange where studentId = ?";
        return getForList(sql, studentId);
    }

    @Override
    public void insert(ExamArrange examArrange) {
        String sql = "insert into examarrange values(?,?,?,?,?,?,?,?,?,?)";
        update(sql , examArrange.getYearTerm(),examArrange.getStudentId(), examArrange.getStudentName(),
                examArrange.getExamCourse(), examArrange.getExamWay(),examArrange.getExamTime(),
                examArrange.getExamWeek(),examArrange.getExamCampus(), examArrange.getExamplace(),
                examArrange.getExamSeatNum());

    }

    @Override
    public void update(ExamArrange examArrange) {
        String sql = "update examarrange set StudentName = ?,ExamWay = ?, ExamTime = ?, " +
                "ExamWeek = ?, ExamCampus = ?, Examplace = ?, ExamSeatNum = ? " +
                "where YearTerm = ? and studentId = ? and ExamCourse = ?";
        update(sql, examArrange.getStudentName(), examArrange.getExamWay(),examArrange.getExamTime(),
                examArrange.getExamWeek(),examArrange.getExamCampus(), examArrange.getExamplace(),
                examArrange.getExamSeatNum(),examArrange.getYearTerm(),examArrange.getStudentId(),
                examArrange.getExamCourse());

    }

    @Override
    public void delete(String studentId) {
        String sql = "delete from examarrange where studentId = ?";
        update(sql, studentId);
    }

    @Override
    public long getCountWithName(String studentId) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<ExamArrange> getAllWithYearTerm(String studentId,
                                                String yearTerm) {
        String sql = "SELECT * FROM examarrange where studentId = ? and yearTerm = ?;";
        return getForList(sql, studentId, yearTerm);
    }

}
