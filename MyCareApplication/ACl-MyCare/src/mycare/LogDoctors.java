package mycare;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogDoctors")
public class LogDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LogDoctors() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String email=request.getParameter("email");
		String pass = request.getParameter("pass");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "acl";
		String psw = "arun";
		

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(url,user,psw);
			
			PreparedStatement pst = conn.prepareStatement("select * from doctors where email=? and pass=?");
			pst.setString(1, email);
			pst.setString(2, pass);
			
			
			
			if(pst.executeUpdate()==1){
				
				RequestDispatcher rd=request.getRequestDispatcher("/MyCareHome.html");  
		        rd.include(request, response);
				
		        
			}
			else{
				
				RequestDispatcher rd=request.getRequestDispatcher("/Login.html");  
		        rd.include(request, response);
		        out.print("<script> alert('Check credentials or Try Sign up'); </script>"); 
		        
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("/Login.html");  
	        rd.include(request, response);
	        out.print("<script> alert('Login Failed! Check Credentials!'); </script>"); 
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
