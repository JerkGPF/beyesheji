package servlet;

import dao.OptionalCourseDAO;
import dao.StudentOptCourseDAO;
import entity.OptionalCourse;
import entity.StudentOptCourse;
import entity.User;
import impl.OptionalCourseDAOImpl;
import impl.StudentOptCourseDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("*.optional")
public class OptionalCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    OptionalCourseDAO oc = new OptionalCourseDAOImpl();
    StudentOptCourseDAO soc = new StudentOptCourseDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取ServletPath
        String servletPath = request.getServletPath();
        //2.去除 / 和 .optional
        String methodName = servletPath.substring(1, servletPath.length() - 9);

        try {
            //3.利用反射获取methodName对应的方法
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //4.利用反射调用对应的方法
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //查询选修课程信息
    @SuppressWarnings("unused")
    private void queryOptionalCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String yearTerm = request.getParameter("yearTerm");

        Map<OptionalCourse, String> map = new HashMap<>();
        List<OptionalCourse> optionalCourses = oc.getAllWithYearTerm(yearTerm);
        //查询该学生已报名的课程
        for(OptionalCourse optionalCourse: optionalCourses){
            StudentOptCourse studentOptCourse = new StudentOptCourse(user.getUsername(), optionalCourse.getCourseId());
            if(soc.get(studentOptCourse) != null){
                map.put(optionalCourse, "是");
            }else{
                map.put(optionalCourse, "否");
            }
        }
        session.setAttribute("map", map);

        response.sendRedirect(request.getContextPath() + "/view/student/student.jsp");
    }

    //学生报名选修课程
    @SuppressWarnings("unused")
    private void studentApply(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String courseId = request.getParameter("courseId");


        StudentOptCourse studentOptCourse = new StudentOptCourse(user.getUsername(), courseId);
        if(soc.get(studentOptCourse) != null){
            session.setAttribute("message", "该课程已报名，请勿重复报名!");

            response.sendRedirect(request.getContextPath() + "/view/student/student.jsp");

            return;
        }
        soc.insert(studentOptCourse);

        session.setAttribute("message", "报名成功!");


        response.sendRedirect(request.getContextPath() + "/view/student/student.jsp");
    }
}
