package mycare;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

import javafx.scene.image.Image;

/**
 * 
 * @author www.luv2code.com
 *
 */
public class ImageInsert {

	public static void main(String[] args) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		FileInputStream input = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1. Get a connection to database
			myConn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "arun", "arun");

//			 2. Prepare statement

//			myStmt = myConn.prepareStatement("insert into img values(?,?)");
			
			// 3. Set parameter for resume file name
//			File theFile = new File("D://acl.jpg");
//			input = new FileInputStream(theFile);
//			myStmt.setString(1, "Arun");
//			myStmt.setBinaryStream(2, new FileInputStream(theFile));
			
//			System.out.println("Reading input file: " + theFile.getAbsolutePath());
			
			// 4. Execute statement
//			System.out.println("\nStoring resume in database: " + theFile);
//			System.out.println(sql);
			
//			System.out.println("Exists :"+theFile.exists());
			
//			myStmt.executeUpdate();
			
			String a="acl";
			a.concat(".jpg");
			
			System.out.println("\nCompleted successfully!"+a+" "+a.length());
			
			
	

			
			
		} catch (Exception exc) {
			exc.printStackTrace();
		} finally {			
			if (input != null) {
				input.close();
			}
			
			close(myConn, myStmt);			
		}
	}

	private static void close(Connection myConn, Statement myStmt)
			throws SQLException {

		if (myStmt != null) {
			myStmt.close();
		}
		
		if (myConn != null) {
			myConn.close();
		}
	}

}
