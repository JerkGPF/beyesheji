package servlet.teacher;

import dao.student.StudentBasicInforDAO;
import dao.student.StudentGradeDAO;
import entity.student.CriterStudent;
import entity.student.StudentBasicInformation;
import entity.student.StudentGrade;
import impl.student.StudentBasicInforDAOImpl;
import impl.student.StudentGradeDAOIpml;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/teagrade")
public class Tea_grade_inquire extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码
        HttpSession session = request.getSession();
        String yearTerm = request.getParameter("yearTerm");

        List<StudentBasicInformation> students = getStudent(request, response);


        Map<StudentBasicInformation,List<StudentGrade>> map = getAllGradeMap(students, yearTerm);

        session.setAttribute("map", map);

        response.sendRedirect(request.getContextPath() + "/view/teacher/grade.jsp");
    }



    private Map<StudentBasicInformation, List<StudentGrade>> getAllGradeMap(
            List<StudentBasicInformation> students, String yearTerm) {
        Map<StudentBasicInformation,List<StudentGrade>> map = new HashMap<>();
        StudentGradeDAO sgd = new StudentGradeDAOIpml();

        for(StudentBasicInformation sbi : students){
            List<StudentGrade> studentGrades = sgd.getAllWithYearTerm(sbi.getStudentId(),yearTerm);
            map.put(sbi, studentGrades);
        }
        return map;
    }

    //获取条件查询到的所有学生信息
    private List<StudentBasicInformation> getStudent(
            HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String academy = request.getParameter("academy");  //学院
        String profession = request.getParameter("profession");
        String className = request.getParameter("className");
        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");

        CriterStudent cs = new CriterStudent(academy, profession, className, studentName, studentId);
        StudentBasicInforDAO sbi = new StudentBasicInforDAOImpl();

        return sbi.getForListWithCriterStudent(cs);
    }


}
