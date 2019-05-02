package servlet;

import entity.User;
import impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录转发
 * 获取登录用户的信息，并判断登录用户的身份
 * 根据用户的身份转到对应的用户页面
 *
 */
@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//防止乱码


        //获取请求参数username和password
        String username = request.getParameter("username");

        //从数据库获取登录账号信息
        User user = get(username);

        //将查到的user放进session中
        if(user != null){
            String identity = user.getIdentity();
            request.getSession().setAttribute("user", user);

            //根据登录账号的身份不同重定向到不同的页面
            if(identity.equals("学生")){
                response.sendRedirect(request.getContextPath() + "/view/student/student.jsp");
                return;
            }
            if(identity.equals("教师")){
                response.sendRedirect(request.getContextPath() + "/view/teacher/teacher.jsp");
                return;
            }
            if(identity.equals("管理员")){
                response.sendRedirect(request.getContextPath() + "/view/admin/admin.jsp");
                return;
            }
        }



    }

    private User get(String username) {
        //进入数据库查询
        UserDAOImpl userDAOImpl = new UserDAOImpl();
        User user = userDAOImpl.get(username);
        if(user != null){
            //返回user
            return user;
        }
        return null;
    }
}
