package impl.student;

import dao.DAO;
import dao.student.LevelExaminationDAO;
import entity.student.LevelExamination;

import java.util.List;

public class LevelExaminationDAOImpl extends DAO<LevelExamination> implements
        LevelExaminationDAO {




    @Override
    public List<LevelExamination> getAllWithYearTerm(String studentId, String yearTerm) {
        String sql;

        if(yearTerm != null){
            sql = "SELECT * FROM cetGrade where yearTerm like '%" + yearTerm +"%' and studentId = ?;";
            return getForList(sql,studentId);
        }else{
            sql = "SELECT * FROM cetGrade where studentId = ?;";
            return getForList(sql,studentId);
        }



    }

    @Override
    public List<LevelExamination> getAllLevelWithStudentId(String studentId) {
        String sql = "SELECT * FROM cetGrade where studentId = ? ;";
        return getForList(sql, studentId);
    }

    @Override
    public void insert(LevelExamination levalExamination) {
        // TODO Auto-generated method stub

    }

    @Override
    public void update(LevelExamination levalExamination) {
        // TODO Auto-generated method stub

    }

    @Override
    public void delete(Long studentId) {
        // TODO Auto-generated method stub

    }

    @Override
    public Integer getCountWithStudentId(Long studentId) {
        // TODO Auto-generated method stub
        return null;
    }


}
