package servlet;

import dao.CourseScheduleDAO;
import entity.CourseSchedule;
import entity.CourseScheduleShow;
import entity.User;
import impl.CourseScheduleDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/courseScheduleServlet")
public class CourseScheduleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String yearTerm = request.getParameter("yearTerm");
        String week = request.getParameter("week");
        User user = (User) session.getAttribute("user");
        if(yearTerm != "" && yearTerm != null && week != null && week != ""){
            List<CourseSchedule> courseSchedules = getCourseSchedule(user.getUsername(), yearTerm, week);

            List<CourseScheduleShow> courseScheduleShows = getCourseScheduleShow(courseSchedules);

            session.setAttribute("courseScheduleShows", courseScheduleShows);
        }

        response.sendRedirect(request.getContextPath() + "/view/student/information/timeTable.jsp");
    }


    private List<CourseScheduleShow> getCourseScheduleShow(
            List<CourseSchedule> courseSchedules) {
        List<CourseScheduleShow> courseScheduleShows = new ArrayList<CourseScheduleShow>();


        String[] joints = {"1-2","3-4","5","6-7","8-9","10-12"};
        String[] weekdays = {"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};


        if(courseSchedules != null){
            for(int i = 0;i < 6;i++){
                CourseSchedule[] weekday = new CourseSchedule[7];
                for(CourseSchedule courseSchedule : courseSchedules){
                    if(courseSchedule.getJoint().equals(joints[i])){
                        for(int j = 0;j < 7;j++){
                            if(courseSchedule.getWeekday().equals(weekdays[j])){
                                weekday[j] = courseSchedule;
                            }
                        }
                    }
                }
                CourseScheduleShow courseScheduleShow = new CourseScheduleShow(joints[i],
                        weekday[0], weekday[1], weekday[2], weekday[3], weekday[4], weekday[5], weekday[6]);
                courseScheduleShows.add(courseScheduleShow);
            }
        }

        return courseScheduleShows;
    }


    private List<CourseSchedule> getCourseSchedule(String studentId,
                                                   String yearTerm, String week) {
        CourseScheduleDAO csd = new CourseScheduleDAOImpl();
        return csd.getAllWithYearTerm(studentId, yearTerm, week);
    }


}
