package myservlet.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

/**
 * Servlet implementation class HandleRegister
 */
@WebServlet("/HandleLogin")
public class HandleLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        //2.1获取用户填写验证码
        String verifycode = request.getParameter("verifycode");

        //3.验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性
        if (!checkcode_server.equalsIgnoreCase(verifycode)) {
            //验证码不正确
            //提示信息
            request.setAttribute("login_msg", "验证码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);

            return;
        }


        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection con;
        PreparedStatement pstmt;
        Login loginBean = null;
        String backNews = "";
        // HttpSession session=request.getSession();
        //选中ctrl + alt +t
        //if  选中 ifn
        //补全代码  ctrl+alt+v

        try {
            loginBean = (Login) session.getAttribute("login");
            if (loginBean == null) {
                loginBean = new Login();
                session.setAttribute("login", loginBean);
            }
        } catch (Exception ee) {
            loginBean = new Login();
            session.setAttribute("login", loginBean);
        }
        request.setCharacterEncoding("utf-8");
        String logname = request.getParameter("logname");
        String password = request.getParameter("password");
        boolean ok = loginBean.isSuccess();
        if (ok == true && logname.equals(loginBean.getLogname())) {
            backNews = logname + "已经登录了";
            loginBean.setBackNews(backNews);
        } else {
            String uri = "jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8";
            boolean boo = (logname.length() > 0) && (password.length() > 0);
            try {
                con = DriverManager.getConnection(uri, "root", "123");
                String sql = "select * from member where logname=? and password=?";
                pstmt = con.prepareStatement(sql);
                if (boo) {
                    pstmt.setString(1, logname);
                    pstmt.setString(2, password);
                    ResultSet rs = pstmt.executeQuery();
                    boolean m = rs.next();
                    if (m == true) {
                        backNews = "恭喜你，登录成功啦!";
                        loginBean.setBackNews(backNews);
                        loginBean.setSuccess(true);
                        loginBean.setLogname(logname);
                        loginBean.setPassword(password);
                    } else {
                        request.setAttribute("login_msg", "您输入的用户名不存在，或密码不匹配！");
                        backNews = "您输入的用户名不存在，或密码不匹配";
                        loginBean.setBackNews(backNews);
                        loginBean.setSuccess(false);
                        loginBean.setLogname(logname);
                        loginBean.setPassword(password);
                    }
                } else {
                    backNews = "您没有要求输入用户名和密码";
                    loginBean.setBackNews(backNews);
                    loginBean.setSuccess(false);
                    loginBean.setLogname(logname);
                    loginBean.setPassword(password);
                }
                con.close();
            } catch (SQLException exp) {
                backNews = "" + exp;
                loginBean.setBackNews(backNews);
                loginBean.setSuccess(false);
            }
        }if (loginBean.isSuccess()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("showLoginMess.jsp");
            dispatcher.forward(request, response);
        }
        else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
