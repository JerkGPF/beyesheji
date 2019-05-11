package servlet.teacher;

import dao.student.StudentOptCourseDAO;
import entity.student.OptionalCourse;
import entity.student.StudentOptCourse;
import impl.student.StudentOptCourseDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/gradeModify")
public class Tea_grade extends HttpServlet {

    private StudentOptCourseDAO studentOptCourseDAO=new StudentOptCourseDAOImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        StudentOptCourse studentOptCourse=new StudentOptCourse(studentId,courseId);
        studentOptCourseDAO.update(studentOptCourse);

        response.sendRedirect("/view/teacher/grade_modify.jsp");
    }
}
