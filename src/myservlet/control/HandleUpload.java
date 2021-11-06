package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import mybean.data.Login;

/**
 * Servlet implementation class HandleUpload
 */
@WebServlet("/HandleUpload")
public class HandleUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Login login = (Login) session.getAttribute("login");
        if (login == null) {
            out.println("<h1 align='center'>该功能需要登录才能操作！</h1>");
        } else {
            //1.实例化
            SmartUpload su = new SmartUpload();
            //2.初始化
            su.initialize(getServletConfig(), request, response);
            //3.上传
            try {
                su.upload();
                su.save("/img");
                String picName = su.getFiles().getFile(0).getFileName();
                System.out.println(picName);
                //4.更新数据库中对应pic字段内容
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://127.0.01:3306/test?characterEncoding=UTF-8";
                String user = "root";
                String pwd = "123";
                //建立对象
                Connection conn;
                conn = DriverManager.getConnection(url, user, pwd);
                String sql = "update member set pic=? where logname=?";
                PreparedStatement pstmt;
                pstmt = conn.prepareStatement(sql);
                //执行更新
                pstmt.setString(1, picName);
                pstmt.setString(2, login.getLogname());
                int flag = pstmt.executeUpdate();
                //处理结果
                if (flag != 0) {
                    out.println("恭喜您，照片更换成功！");
                } else {
                    out.println("对不起，照片更新失败！");
                }
                //关闭连接
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }

        }

    }

}
