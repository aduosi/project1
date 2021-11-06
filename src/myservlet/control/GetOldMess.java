package myservlet.control;

import java.io.IOException;

import mybean.data.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetOldMess
 */
@WebServlet("/GetOldMess")
public class GetOldMess extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Login login = (Login) session.getAttribute("login");
        boolean ok = true;
        if (login == null) {
            ok = false;
            response.sendRedirect("login.jsp");
        }
        if (ok == true) {
            continueWork(request, response);
        }
    }

    public void continueWork(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Login login = (Login) session.getAttribute("login");
        Connection con = null;
        String logname = login.getLogname();
        Register register = new Register();
        request.setAttribute("register", register);
        String uri = "jdbc:mysql://127.0.0.1:3306/test?characterEncoding=utf-8";
        try {
            con = DriverManager.getConnection(uri, "root", "123");
            Statement sql = con.createStatement();
            ResultSet rs =
                    sql.executeQuery("SELECT * FROM member where logname='" + logname + "'");
            if (rs.next()) {
                register.setLogname(rs.getString(1));
                register.setSex(rs.getString(3));
                register.setAge(rs.getInt(4));
                register.setPhone(rs.getString(5));
                register.setEmail(rs.getString(6));
                register.setMessage(rs.getString(7));
                register.setBackNews("您原来的注册信息为：");
            }
        } catch (SQLException exp) {
            register.setBackNews("SQL出错啦" + exp);
        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("inputModifyMess.jsp");
        dispatcher.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
