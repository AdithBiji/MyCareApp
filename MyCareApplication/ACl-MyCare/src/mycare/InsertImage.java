package mycare;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertImage {

	public static void main(String[] args) throws FileNotFoundException{
		
		
		try {
			
			PrintWriter out;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "arun","arun");
		
		System.out.println("Connection Estabilshed");
		
		File fl = new File("D://acl.jpg");
		
		InputStream fis = new FileInputStream(fl);
		
		
		System.out.println("Converting Bytes");
		
		PreparedStatement ps = conn.prepareStatement("insert into img values (?,?)");
		ps.setString(1, "Arun");
		ps.setBinaryStream(2, fis,(int) fl.length());
		
		if(ps.executeUpdate()>0)
			System.out.println("Sucess");
		else
			System.out.println("Failed");
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
}
