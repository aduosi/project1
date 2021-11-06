package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;


@WebServlet("/HandleExit")
public class HandleExit extends HttpServlet {
	 public String handleString(String s)
	   {   try{ byte bb[]=s.getBytes("iso-8859-1");
	            s=new String(bb);
	          }
	       catch(Exception ee){} 
	       return s;  
	   }

	   public  void   continueDoPost(HttpServletRequest request, HttpServletResponse response)
	                                  throws ServletException,IOException
	    {   HttpSession session=request.getSession(true); 
	        session.invalidate();              //销毁用户的session对象
	        response.sendRedirect("index.jsp"); //返回主页   
	    }
	   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
	                        throws ServletException,IOException
	    {   
		   HttpSession session=request.getSession(true); 
	       Login login=(Login)session.getAttribute("login"); //获取用户登录时的Javabean
	       boolean ok=true; 
	       if(login==null)
	       { ok=false; 
	         response.sendRedirect("login.jsp");             //重定向到登录页面
	       }
	       if(ok==true)
	       {  continueDoPost(request,response);
	       }
	    }

}
