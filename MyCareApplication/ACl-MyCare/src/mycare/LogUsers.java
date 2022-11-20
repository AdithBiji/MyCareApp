package mycare;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/LogUsers")
public class LogUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogUsers() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "acl";
		String psw = "arun";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, user, psw);
			Statement stmt = con.createStatement();
			
			PreparedStatement ps;
			String email = request.getParameter("email");
			String pass  =  request.getParameter("pass"); 			
			
			ps = con.prepareStatement("select user_name from users where user_email=?");
			ps.setString(1, email);
			 
			 if(ps.executeUpdate()==1){
				 
				 PreparedStatement rs =con.prepareStatement("select user_email,user_pass from users where user_email=? and user_pass=?"); 
				 rs.setString(1, email);
				 rs.setString(2, pass);
				 
				 if(rs.executeUpdate()>0){
					 
					 PreparedStatement rt = con.prepareStatement("select user_email,user_pass,user_role from users where user_email=?");
					 rt.setString(1,email);
					 ResultSet rst = rt.executeQuery();
					 
					 while(rst.next()){
						 
						 if(rst.getString("user_role").equals("Patient")){
							 
							 HttpSession session = request.getSession();
							 session.setAttribute("email", email);
							 
							 RequestDispatcher rd= request.getRequestDispatcher("Profile.jsp");
							 rd.include(request, response); 
						 }
						 else if(rst.getString("user_role").equals("Doctor")){
							 RequestDispatcher rd= request.getRequestDispatcher("MyCareConsultations.html");
							 rd.include(request, response); 
						 }
						 else if(rst.getString("user_role").equals("Pharmacist")){
							 RequestDispatcher rd= request.getRequestDispatcher("MyCarePharamauticals.html");
							 rd.include(request, response); 
						 }
						 
					 }
					 
					 
					 
				 }
				 else{
					 RequestDispatcher rd= request.getRequestDispatcher("Home.html");
						rd.include(request, response);
						out.print("<body ><script> alert('Check Password and try again!'); </script>");
				 }
					
			 }
			 else{
				 
		            RequestDispatcher rd= request.getRequestDispatcher("Home.html");
					rd.include(request, response);
					out.print("<body ><script> alert('Check Email and try again!'); </script>");
			 }
			 
			 		
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
