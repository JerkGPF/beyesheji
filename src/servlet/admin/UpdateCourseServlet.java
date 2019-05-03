package servlet.admin;

import dao.student.OptionalCourseDAO;
import entity.student.OptionalCourse;
import impl.student.OptionalCourseDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCourse")
public class UpdateCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      super.doGet(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");//防止乱码
        String courseId = req.getParameter("courseId");//获取jsp页面传过来的参数
        String courseName=req.getParameter("courseName");
        String yearTerm =req.getParameter("yearTerm");
        String credit = req.getParameter("credit");
        String courseType=req.getParameter("courseType");
        String teacher =req.getParameter("teacher");
        String classWay = req.getParameter("classWay");
        String classTime=req.getParameter("classTime");

        OptionalCourse optionalCourse=new OptionalCourse();
        optionalCourse.setCourseId(courseId);
        optionalCourse.setCourseName(courseName);
        optionalCourse.setYearTerm(yearTerm);
        optionalCourse.setCredit(credit);
        optionalCourse.setCourseType(courseType);
        optionalCourse.setTeacher(teacher);
        optionalCourse.setClassWay(classWay);
        optionalCourse.setClassTime(classTime);

        OptionalCourseDAO optionalCourseDAO = new OptionalCourseDAOImpl();
        optionalCourseDAO.insert(optionalCourse);

        String message = "添加成功";
        req.setAttribute("message", message);

        resp.sendRedirect("optStudent.List");
    }
}
