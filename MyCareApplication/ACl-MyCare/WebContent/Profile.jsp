<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>	
		
		
		<!DOCTYPE html>
		<html>

		<head>
  			<title>My Care - Profile</title>
  					<link rel="shortcut icon" href="acl.ico" type="image/x-icon">
 					<meta name="viewport" content="width=device-width, initial-scale=1">
  					<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  					<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  					<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
 					<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
 					<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 					 <link rel="stylesheet" href="css/profile.css" type="text/css">
		</head>

		<body>



  		<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
  		<ul>
    		<div id="myDiv">
      			<a href="HospitalsPage.jsp" target="_self"><button class="a">Hospital</button></a>
      			<a href="PharmacyPage.jsp" target="_self"><button class="a">Pharmacy</button></a>
      			<a href="CommunityPage.jsp" target="_self"><button class="a">Community</button></a>
      			<a href="MyList.html"><button class="a">My List</button></a>
      			<a href="Profile.jsp"><button class="a active">Profile</button></a>
    	</div>
  		</ul>
  		
 	<%		
 	
			String email = (String)session.getAttribute("email"); ;
			
				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users WHERE user_email=?");
			pstmt.setString(1, email);
			ResultSet resultSet = pstmt.executeQuery();
			
			while(resultSet.next()){
			
	%> 		
  		


  		<h1 class="large-font">My Profile</h1>
  				<div class="CommunityColumn" style=" background-image: url('logimg1.jpg');">
    			<div class="medium-font"><%=resultSet.getString("user_name") %></div>
    			<img class="img2" src="Images/Profile/<%=resultSet.getString("user_img_url").concat(".jpg") %>">
    			<div class="bio">
      			<b class="b1">BIO</b><br>
      		<%=resultSet.getString("user_bio") %></div>
    		<div class="likes"><i class="fa fa-user-circle-o"> </i> 25 Joined Communities</i></div><br>
    		<div class="likes"><i class="fa fa-heart"> </i> 15 Liked Products</i></div>


   		 <a class="all-trigger" onclick="document.getElementById('id01').style.display='block'"
      		style="text-decoration: none;">Edit Profile</a>
    		<div id="id01" class="modal">


      <form id="form" class="modal-content">
        <span onclick="document.getElementById('id01').style.display='none'" class="close"
          title="Close Modal">&times;</span>

        <div class="container1">
          <h1 class="topline">Edit Profile</h1>
          <p class="toppara">Make changes to your Account Details</p>

          <input type="text" value="<%=resultSet.getString("user_name") %>" name="Name">
          <input type="text"  value="<%=resultSet.getString("user_ph") %>" name="ph.no">
          <input type="text" value="<%=resultSet.getString("user_email") %>" name="email">
          <input type="text"  value="<%=resultSet.getString("user_addr_str") %>" name="email">
          <input type="text" name="area"  value="<%=resultSet.getString("user_addr_cty") %>" />
          <select name="state" placeholder="State">
            <option value="<%=resultSet.getString("user_addr_stt") %>"><%=resultSet.getString("user_addr_stt") %></option>
            <option value="AN">Andaman and Nicobar Islands</option>
            <option value="AP">Andhra Pradesh</option>
            <option value="AR">Arunachal Pradesh</option>
            <option value="AS">Assam</option>
            <option value="BR">Bihar</option>
            <option value="CH">Chandigarh</option>
            <option value="CT">Chhattisgarh</option>
            <option value="DN">Dadra and Nagar Haveli</option>
            <option value="DD">Daman and Diu</option>
            <option value="DL">Delhi</option>
            <option value="GA">Goa</option>
            <option value="GJ">Gujarat</option>
            <option value="HR">Haryana</option>
            <option value="HP">Himachal Pradesh</option>
            <option value="JK">Jammu and Kashmir</option>
            <option value="JH">Jharkhand</option>
            <option value="KA">Karnataka</option>
            <option value="KL">Kerala</option>
            <option value="LD">Lakshadweep</option>
            <option value="MP">Madhya Pradesh</option>
            <option value="MH">Maharashtra</option>
            <option value="MN">Manipur</option>
            <option value="ML">Meghalaya</option>
            <option value="MZ">Mizoram</option>
            <option value="NL">Nagaland</option>
            <option value="OR">Orissa</option>
            <option value="PY">Pondicherry</option>
            <option value="PB">Punjab</option>
            <option value="RJ">Rajasthan</option>
            <option value="SK">Sikkim</option>
            <option value="TN">Tamil Nadu</option>
            <option value="TR">Tripura</option>
            <option value="UP">Uttar Pradesh</option>
            <option value="UL">Uttaranchal</option>
            <option value="WB">West Bengal</option>
          </select>
          <input type="number" name="zip"  value="<%=resultSet.getString("user_pincode") %>" />
          <textarea rows="3" placeholder="Medical History" name="medHistory"></textarea>


          <button class="bookbtn"> Make Changes</button>
          <button onClick="window.open('Profile.jsp');" class="cancelbtn">Cancel</button>
          

        </div>
    </div>
    </form>

    <a class="all-trigger" href="Cart.html">View Cart</a>
    <button class="button2" onclick="alert('Send Distress Signal to nearest hospital ??')">SOS</button>
  	</div>
  	<div class="row"></div>
  	<br><br>
  	
  	
  		<%
			}

			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		%>

	<!-- 			<script type="text/javascript"> -->
	// alert('Error Occured');
	<!-- 			</script> -->

	<%
			
		}
		finally{
			
		}
	%>
  	
  	
  	
  	
  	<div class="footer" style="text-align:center">
    <p>Copyrights - MyCare &copy; </p>

  	</div>
 	 </div>
	</body>

	</html>