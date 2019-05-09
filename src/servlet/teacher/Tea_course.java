package servlet.teacher;

import dao.student.OptionalCourseDAO;
import dao.student.StudentOptCourseDAO;
import entity.User;
import entity.student.OptionalCourse;
import entity.student.StudentOptCourse;
import impl.student.OptionalCourseDAOImpl;
import impl.student.StudentOptCourseDAOImpl;

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

@WebServlet("/tea_course")
public class Tea_course extends HttpServlet {
    private static final long serialVersionUID = 1L;

    OptionalCourseDAO oc = new OptionalCourseDAOImpl();
    StudentOptCourseDAO soc = new StudentOptCourseDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
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
        request.setCharacterEncoding("UTF-8");
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

        response.sendRedirect(request.getContextPath() + "/view/teacher/information/courseinformation.jsp");
    }
}
