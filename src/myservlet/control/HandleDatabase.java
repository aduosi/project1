package myservlet.control;

import com.sun.rowset.CachedRowSetImpl;
import mybean.data.Login;
import mybean.data.Register;
import mybean.data.ShowBypage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
@WebServlet("/HandleDatabase")
public class HandleDatabase extends HttpServlet {
    CachedRowSetImpl rowSet = null;

    //加载驱动
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Login login = (Login) session.getAttribute("login");
        boolean ok = true;
        if (login == null) {
            ok = false;
            resp.sendRedirect("login.jsp"); //重定向到登录页面
        }
        if (ok == true) {
            continueDoGet(req, resp);
        }
    }

    public void continueDoGet(HttpServletRequest req, HttpServletResponse resp) {
        Register register = new Register();
        String logname = req.getParameter("logname");

        Connection con = null;
        String url = "jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8";
        String user = "root";
        String pwd = "123";

        try {
            con = DriverManager.getConnection(url, user, pwd);
            //4.建立语句对象
            Statement stmt = con.createStatement();
            //sql语句
            String sql = "select*from member Where logname=" + logname + "";
            //5.执行查询
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                register.setLogname(rs.getString(1));
                register.setSex(rs.getString(3));
                register.setAge(rs.getInt(4));
                register.setPhone(rs.getString(5));
                register.setEmail(rs.getString(6));
                register.setMessage(rs.getString(7));
                register.setPic(rs.getString(8));
                register.setBackNews("查询到的会员信息");
            }
            con.close();
            RequestDispatcher dispatcher = req.getRequestDispatcher("/showAllMember.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception throwables) {
            register.setBackNews(" " + throwables);
            System.out.println("ok1" + throwables);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Login login = (Login) session.getAttribute("login");
        boolean ok = true;
        if (login == null) {
            ok = false;
            resp.sendRedirect("login.jsp"); //重定向到登录页面
        }
        if (ok == true) {
            continueDoPost(req, resp);
        }
    }

    public void continueDoPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Connection con = null;
        StringBuffer presentPageResult = new StringBuffer();
        ShowBypage showBypage = null;

        showBypage = (ShowBypage) session.getAttribute("show");
        try {
            if (showBypage == null) {
                showBypage = new ShowBypage();//创建javabean对象
                session.setAttribute("show", showBypage);
            }
        } catch (Exception e) {
            showBypage = new ShowBypage();
            session.setAttribute("show", showBypage);
        }

        showBypage.setPageSize(10);//每页显示10条记录
        int showPage = Integer.parseInt(req.getParameter("showPage"));
        if (showPage > showBypage.getPageAllCount())
            showPage = 1;

        if (showPage <= 0)
            showPage = showBypage.getPageAllCount();
            showBypage.setShowPage(showPage);
            int pageSize = showBypage.getPageSize();

            String url = "jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8";
            String user = "root";
            String pwd = "123";

            try {
                con = DriverManager.getConnection(url, user, pwd);
                //4.建立语句对象
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                //sql语句
                String sql = "select*from member";
                //5.执行查询
                ResultSet rs = stmt.executeQuery(sql);
                //创建行集对象
                rowSet = new CachedRowSetImpl();

                rowSet.populate(rs);
                //关闭连接
                con.close();
                showBypage.setRowSet(rowSet); //数据存储在showBean
                rowSet.last();
                int m = rowSet.getRow(); //总行数
                int n = pageSize;
                int pageAllCount = (m % n == 0) ? (m / n) : (m / n + 1);
                showBypage.setPageAllCount(pageAllCount);
                presentPageResult = show(showPage, pageSize, rowSet);
                showBypage.setPresentPageResult(presentPageResult);

            } catch (SQLException throwables) {

            }
            RequestDispatcher dispatcher = req.getRequestDispatcher("showAllMemeber.jsp");
            dispatcher.forward(req, resp);

    }

    public StringBuffer show(int page, int pageSize, CachedRowSetImpl rowSet) throws SQLException {
        StringBuffer stringBuffer = new StringBuffer();
        rowSet.absolute((page - 1) * pageSize + 1);
        try {
            for (int i = 1; i < pageSize; i++) {
                stringBuffer.append("<tr>");
                stringBuffer.append("<td>" + rowSet.getString(1) + "</td>");
//                stringBuffer.append("<td>" + rowSet.getString(2) + "</td>");
                stringBuffer.append("<td>" + rowSet.getString(3) + "</td>");
                stringBuffer.append("<td>" + rowSet.getInt(4) + "</td>");
                stringBuffer.append("<td>" + rowSet.getString(5) + "</td>");
                stringBuffer.append("<td>" + rowSet.getString(6) + "</td>");
                stringBuffer.append("<td>" + rowSet.getString(7) + "</td>");
                stringBuffer.append("<td>" + "<img  width='30' height='30'  src='img/" + rowSet.getString(8) + "'>" + "</td>");
                stringBuffer.append("</tr>");
                rowSet.next();
            }
        } catch (SQLException throwables) {
        }
        return stringBuffer;
    }


}
