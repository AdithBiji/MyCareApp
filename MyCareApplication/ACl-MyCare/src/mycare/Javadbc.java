package mycare;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Javadbc {

	public static void main(String[] args) {

		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","arun","arun");  
		  
		//step3 create the statement object  
		Statement stmt=con.createStatement();  
		  
		//step4 execute query  
		ResultSet rs=stmt.executeQuery("select * from test");  
		while(rs.next())  
		System.out.println(rs.getString("id"));  
		  
		//step5 close the connection object  
		con.close();  
				
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
