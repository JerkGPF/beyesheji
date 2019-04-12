package servlet;

import dao.TeacherDAO;
import entity.Teacher;
import entity.User;
import impl.TeacherDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/teacherInquireServlet")

public class Tea_inquire extends HttpServlet {
    private static final long serialVersionUID = 1L;

    TeacherDAO teacherdao = new TeacherDAOImpl();

    //获得教师信息，转换到显示页面显示教师信息
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Teacher teacher = get(user);

        request.setAttribute("teacher", teacher);

        request.getRequestDispatcher("/view/teacher/teacher.jsp").forward(request, response);
    }

    private Teacher get(User user) {

        Teacher teacher = teacherdao.get(user.getUsername());
        if(teacher != null){
            return teacher;
        }

        return null;
    }

    //修改教师信息，转换回到显示页面显示修改后的教师信息
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Teacher teacher = getTeacher(request, response);

        //调用DAO修改数据库中的信息
        teacherdao.update(teacher);

        request.setAttribute("message", "修改成功");
        doGet(request, response);
    }

    private Teacher getTeacher(HttpServletRequest request,
                               HttpServletResponse response)throws ServletException, IOException{
        Teacher teacher = null;

        Enumeration<String> en = request.getParameterNames();
        List<String> parameterValues = new ArrayList<>();
        while(en.hasMoreElements()){
            parameterValues.add(request.getParameter(en.nextElement()));
        }

        teacher = new Teacher(parameterValues.get(0), parameterValues.get(1),
                parameterValues.get(2), parameterValues.get(3), parameterValues.get(4),
                parameterValues.get(6), parameterValues.get(7), parameterValues.get(5),
                parameterValues.get(8), parameterValues.get(10), parameterValues.get(9));

        return teacher;
    }

}
