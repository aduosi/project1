package myservlet.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.Register;

/**
 * Servlet implementation class HandleRegister
 */
@WebServlet("/HandleRegister")
public class HandleRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取表单中数据
        //2.JDBC--insert
        //3.将数据存储在javabean对象
        //4.寻找视图做显示（将JavaBean对象数据显示出来）

        Register  user1=new Register();
        request.setAttribute("user1", user1);

        request.setCharacterEncoding("utf-8");
        String logname=request.getParameter("logname");
        String password=request.getParameter("password");
        String sex=request.getParameter("sex");
        String age=request.getParameter("age");
        int tempage=Integer.parseInt(age);
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String message=request.getParameter("message");
        //System.out.println(logname+password);


        //1.载入JDBC驱动程序
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //2.定义连接的URL
        String url="jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8";
        String user="root";
        String pwd="123";
        //3.建立对象
        Connection conn;
        try {
            conn = DriverManager.getConnection(url,user,pwd);

            //4.建立预处理语句对象
            String sql="insert into member values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt;

            pstmt = conn.prepareStatement(sql);

            //5.执行更新
            pstmt.setString(1,logname );
            pstmt.setString(2,password);
            pstmt.setString(3,sex);
            pstmt.setInt(4,tempage);
            pstmt.setString(5,phone);
            pstmt.setString(6,email);
            pstmt.setString(7,message);
            pstmt.setString(8,"public.jpg");
            int flag=pstmt.executeUpdate();
            //6.处理结果
            if(flag!=0)
            {
                //System.out.println("注册成功");
                user1.setLogname(logname);
                user1.setPassword(password);
                user1.setSex(sex);
                user1.setAge(tempage);
                user1.setPhone(phone);
                user1.setEmail(email);
                user1.setMessage(message);
                user1.setBackNews("恭喜您！！！注册成功");
            }
            else{
                user1.setBackNews("对不起，您的注册过程失败");
            }
            //7.关闭连接
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            user1.setBackNews("对不起，JDBC操作过程有错误");
            e.printStackTrace();
        }

        RequestDispatcher  zhuan=
                request.getRequestDispatcher("showRegisterMess.jsp");
        zhuan.forward(request,response);


    }

}
