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
 * Servlet implementation class HandleModifyMess
 */
@WebServlet("/HandleModifyMess")
public class HandleModifyMess extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }

    public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb, "utf-8");
        } catch (Exception ee) {
        }
        return s;
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
            continueDoPost(request, response);
        }
    }

    public void continueDoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Login login = (Login) session.getAttribute("login");
        String logname = login.getLogname();
        Connection con;
        PreparedStatement sql;
        ModifyMessage modify = new ModifyMessage();
        request.setAttribute("modify", modify);
        int age = Integer.parseInt(request.getParameter("newAge").trim());
        String sex = request.getParameter("newSex").trim(),
                email = request.getParameter("newEmail").trim(),
                phone = request.getParameter("newPhone").trim(),
                message = request.getParameter("newMessage");
        String uri = "jdbc:mysql://127.0.0.1:3306/test?useUnicode=true&characterEncoding=utf-8";
        String backNews = "";
        try {
            con = DriverManager.getConnection(uri, "root", "123");
            String updateCondition =
                    "UPDATE member SET sex=?,"
                            + "age=?,phone=?,email=?,message=? WHERE logname=?";
            sql = con.prepareStatement(updateCondition);
            sql.setString(1, handleString(sex));
            sql.setInt(2, age);
            sql.setString(3, phone);
            sql.setString(4, handleString(email));
            sql.setString(5, handleString(message));
            sql.setString(6, logname);
            int m = sql.executeUpdate();
            if (m == 1) {
                backNews = "??????????????????";
                modify.setBackNews(backNews);
                modify.setLogname(logname);
                modify.setNewAge(age);
                modify.setNewEmail(handleString(email));
                modify.setNewPhone(phone);
                modify.setNewMessage(handleString(message));
                modify.setNewSex(handleString(sex));
            } else {
                backNews = "??????????????????????????????????????????????????????????????????????????????";
                modify.setBackNews(backNews);
            }
            con.close();
        } catch (SQLException exp) {
            modify.setBackNews("??????SQL??????" + exp);
        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("showModifyMess.jsp");
        dispatcher.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
