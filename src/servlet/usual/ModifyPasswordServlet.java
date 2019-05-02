package servlet.usual;

import entity.User;
import impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/modifyPasswordServlet")
public class ModifyPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String newpassword = request.getParameter("newpassword");

        //修改密码
        update(user,newpassword);
        session.setAttribute("message", "修改密码成功");
        response.sendRedirect(request.getContextPath() + "/view/login.jsp");
    }

    private void update(User user, String newpassword) {
        UserDAOImpl u = new UserDAOImpl();

        user.setPassword(newpassword);
        u.update(user);
    }

}
