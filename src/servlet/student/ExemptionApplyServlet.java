package servlet.student;

import dao.student.ExemptionApplyDAO;
import entity.student.ExemptionApply;
import entity.User;
import impl.student.ExemptionApplyDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/exemptionApplyServlet")
public class ExemptionApplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ExemptionApplyDAO pea = new ExemptionApplyDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String yearTerm = request.getParameter("yearTerm");
        String courseName = request.getParameter("courseName");
        String applyReason = request.getParameter("applyReason");

        ExemptionApply exemptionApply = new ExemptionApply(yearTerm, user.getUsername(), courseName, applyReason);
        pea.insert(exemptionApply);

        String message = "提交成功";
        session.setAttribute("message", message);
        response.sendRedirect(request.getContextPath() + "/view/student/management/freeapply.jsp");
    }

}
