package myservlet.control;

import mybean.data.Login;
import mybean.data.Password;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/HandlePassword")
public class HandlePassword extends HttpServlet {
    public static final long seriaVersionUID = 1l;

    public HandlePassword() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession(true);
        Login login = (Login) session.getAttribute("login");
        boolean ok = true;
        if (login == null) {
            ok = false;
            response.sendRedirect("login");
        }
        if (ok = true) {
            continueWork(request, response);
        }
    }

    private void continueWork(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
        HttpSession session = request.getSession(true);
        Login login = (Login) session.getAttribute("login");
        Connection con = null;
        String logname = login.getLogname();
        Password passwordBean = new Password();
        request.setAttribute("password", passwordBean);
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String url = "jdbc:mysql://127.0.0.1:3306/test";

        try {
            con = DriverManager.getConnection(url, "root", "123");
            Statement sql = con.createStatement();
            ResultSet rs = sql.executeQuery("select * from member where logname='" + logname + "'and password='" + oldPassword + "'");
            if (rs.next()) {
                String updateString = "Update member set password='" + newPassword + "'where logname='" + logname + "'";
                int m = sql.executeUpdate(updateString);
                if (m == 1) {
                    passwordBean.setBackNews("密码已更新");
                    passwordBean.setOldPassword(oldPassword);
                    passwordBean.setNewPassword(newPassword);
                } else {
                    passwordBean.setNewPassword("密码更新失败");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("showNewPassword.jsp");
        requestDispatcher.forward(request,response);
    }
}