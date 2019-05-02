package servlet;

import dao.ExamArrangeDAO;
import entity.ExamArrange;
import entity.User;
import impl.ExamArrangeDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/examArrangeServlet")
public class ExamArrangeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ExamArrangeDAO e = new ExamArrangeDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码

        HttpSession session = request.getSession();
        String yearTerm = request.getParameter("yearTerm");
        User user = (User) session.getAttribute("user");

        List<ExamArrange> examArranges = null;

        if(yearTerm != "" && yearTerm != null){
            examArranges = getExamArrange(user.getUsername(), yearTerm);
        }else{
            examArranges = getExamArrange(user.getUsername());
        }
        session.setAttribute("examArranges", examArranges);
        response.sendRedirect(request.getContextPath() +  "/view/student/information/exam.jsp");
    }

    private List<ExamArrange> getExamArrange(String username) {
        return e.getAllWithStudentId(username);
    }

    private List<ExamArrange> getExamArrange(String username, String yearTerm) {
        return e.getAllWithYearTerm(username, yearTerm);
    }
}
