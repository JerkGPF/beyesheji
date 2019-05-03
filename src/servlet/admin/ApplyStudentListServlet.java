package servlet.admin;

import dao.admin.LevelExamDAO;
import dao.admin.LevelExamListDAO;
import dao.student.OptionalCourseDAO;
import dao.student.StudentBasicInforDAO;
import dao.student.StudentOptCourseDAO;
import entity.admin.LevelExam;
import entity.admin.LevelExamList;
import entity.student.CriterStudent;
import entity.student.OptionalCourse;
import entity.student.StudentBasicInformation;
import entity.student.StudentOptCourse;
import impl.admin.LevelExamDAOImpl;
import impl.admin.LevelExamListDAOImpl;
import impl.student.OptionalCourseDAOImpl;
import impl.student.StudentBasicInforDAOImpl;
import impl.student.StudentOptCourseDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("*.List")
public class ApplyStudentListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码
        //1.获取ServletPath
        String servletPath = request.getServletPath();
        //2.去除 / 和 .List
        String methodName = servletPath.substring(1, servletPath.length() - 5);

        try {
            //3.利用反射获取methodName对应的方法
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //4.利用反射调用对应的方法
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //查询考级报名学生名单
    @SuppressWarnings("unused")
    private void levelExam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码
        HttpSession session = request.getSession();
        String yearTerm = request.getParameter("yearTerm");

        List<StudentBasicInformation> students = getStudent(request, response);

        Map<StudentBasicInformation,List<LevelExam>> map = getAllLevelExamMap(students, yearTerm);

        session.setAttribute("map", map);
        response.sendRedirect(request.getContextPath() + "/acdemic_dean/levelexaminationmanage/applystudents.jsp");
    }

    private Map<StudentBasicInformation, List<LevelExam>> getAllLevelExamMap(
            List<StudentBasicInformation> students, String yearTerm) {
        Map<StudentBasicInformation,List<LevelExam>> map = new HashMap<>();
        LevelExamListDAO lel = new LevelExamListDAOImpl();
        LevelExamDAO led = new LevelExamDAOImpl();

        for(StudentBasicInformation sbi : students){
            List<LevelExamList> levelExamLists = lel.getAll(String.valueOf(sbi.getStudentId()));
            List<LevelExam> levelExams = new ArrayList<LevelExam>();
            for(LevelExamList levelExamList: levelExamLists){
                LevelExam levelExam = led.get(levelExamList.getCourseId(),yearTerm);
                if(levelExam != null){
                    levelExams.add(levelExam);
                }
            }

            map.put(sbi, levelExams);
        }
        return map;
    }
    @SuppressWarnings("unused")//删除课程
    private void delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");//防止乱码
        OptionalCourseDAO oc = new OptionalCourseDAOImpl();
        String coursename = request.getParameter("coursename");
        oc.delete(coursename);

        //重定向到query页面
        response.sendRedirect("optStudent.List");
    }

    //获取选修报名的学生
    @SuppressWarnings("unused")
    private void optStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码
        HttpSession session = request.getSession();
        String yearTerm = request.getParameter("yearTerm");

        List<StudentBasicInformation> students = getStudent(request, response);

        Map<StudentBasicInformation,List<OptionalCourse>> map = getAllOptionalCourseMap(students, yearTerm);

        session.setAttribute("map", map);
        request.getRequestDispatcher( "/view/admin/course.jsp").forward(request,response);
    }

    private Map<StudentBasicInformation, List<OptionalCourse>> getAllOptionalCourseMap(
            List<StudentBasicInformation> students, String yearTerm) {
        Map<StudentBasicInformation,List<OptionalCourse>> map = new HashMap<>();
        OptionalCourseDAO oc = new OptionalCourseDAOImpl();
        StudentOptCourseDAO soc = new StudentOptCourseDAOImpl();

        for(StudentBasicInformation sbi : students){
            List<StudentOptCourse> studentOptCourses = soc.getAll(String.valueOf(sbi.getStudentId()));
            List<OptionalCourse> optionalCourses = new ArrayList<OptionalCourse>();
            for(StudentOptCourse studentOptCourse: studentOptCourses){
                OptionalCourse optionalCourse = oc.get(studentOptCourse.getCourseId(),yearTerm);
                if(optionalCourse != null){
                    optionalCourses.add(optionalCourse);
                }
            }

            map.put(sbi, optionalCourses);
        }
        return map;
    }

    //获取要查询的学生信息List
    private List<StudentBasicInformation> getStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");//防止乱码
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
