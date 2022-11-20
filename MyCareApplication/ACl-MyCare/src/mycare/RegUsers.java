package mycare;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegUsers")
public class RegUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegUsers() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
			
			String email = request.getParameter("email");
			String pass  =  request.getParameter("pass"); 
			
			String name = request.getParameter("user_name");
			String role = request.getParameter("role"); 
			String phone = request.getParameter("phone");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("zip");
			
			
			
			 String sql="select user_name from users where user_email='"+email+"'";
			 
			 if(stmt.executeUpdate(sql)==0){
				 
				 PreparedStatement ps =con.prepareStatement("insert into users values(user_id_generator.nextval,?,?,?,?,?,?,?,?,?)"); 
				 
				 ps.setString(1, name);
				 ps.setString(2, email);
				 ps.setString(3, pass);
				 ps.setString(4, role);
				 ps.setString(5, phone);
				 ps.setString(6, street);
				 ps.setString(7, city);
				 ps.setString(8, state);
				 ps.setString(9, pincode);
				 ps.executeUpdate();
				 
				 RequestDispatcher rd= request.getRequestDispatcher("Home.html");
					rd.include(request, response);
					out.print("<body onload='openLogin()'><script> function openLogin() { $('#login').modal('show')}  alert('Register Sucessful! Please Log in'); </script>");
			 }else{
		            
		            RequestDispatcher rd= request.getRequestDispatcher("Home.html");
					rd.include(request, response);
					out.print("<body onload='openLogin()'><script> alert('User Exist!!Try Log in'); </script>");
			 }
			 
			 		
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
