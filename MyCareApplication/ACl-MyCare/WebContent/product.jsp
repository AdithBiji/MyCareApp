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
  		<title>My Care - Pharmacy</title>
  		<link rel="shortcut icon" href="acl.ico" type="image/x-icon">
  		<meta name="viewport" content="width=device-width, initial-scale=1">


  		<link rel="stylesheet" href="css/Pharmacy.css" type="text/css">


  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  	<script>
    		function pop(x) {
      			x.classList.toggle("fa-red-heart");
    		}
   			 function pop2(x) {
      			x.classList.toggle("fa-cart-plus");
    		}
  	</script>

	</head>

	<body onload="document.getElementById('id01').style.display='block'">
  		<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
  			<ul>
    				<div id="myDiv">
      					<a href="HospitalsPage.jsp" target="_self"><button class="a ">Hospital</button></a>
      					<a href="PharmacyPage.jsp" target="_self"><button class="a active">Pharmacy</button></a>
      					<a href="CommunityHome.html" target="_self"><button class="a">Community</button></a>
      					<a href="MyList.html"><button class="a">My List</button></a>
      					<button class="a">Profile</button>
    				</div>
 			 </ul>
 			 
 	<%		String productName=request.getParameter("name");

				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products WHERE prod_name =?");
			pstmt.setString(1, productName);
			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
	%>


  	<div id="id01" class="modal">
    		<div class="modal-content animate">
     		<div class="imgcontainer">
        		<span onclick="window.location.href = 'PharmacyPage.jsp';" class="close"
          			title="Close Modal">&times;</span>
        	<img src="Images/Pharmacy/<%=resultSet.getString("prod_img_url").concat(".jpg") %>" style="height:25vw;width:30vw; border-radius:5px">
        	<h1 style="text-align: center;"><%=resultSet.getString("prod_name") %></h1>
        	<p>Taken For :<%=resultSet.getString("prod_taken_for") %></p>
        	<p>Description :<%=resultSet.getString("prod_det_desc") %></p>
        	<p>No. of Likes : &#10084;  <%=resultSet.getString("prod_likes") %></p>
        	<p>Price: &#8377;<%=resultSet.getString("prod_price") %></p>
        	<p>Price after Community sale : x</p>

        	<center> <button class="sendbtn">Show Communities</button>
          			<a href="MyCareHospitals.html" style="text-decoration: none;">
            <button class="sendbtn">Consult with doctor</button></center>
        			</a>
      		</div>
    	</div>
  	</div>
  	
  	<%
  	
						}
				conn.close();
			}
			catch (Exception e) {
			e.printStackTrace();
			%> alert('Error Occured');<%
	
			}
			finally{
	
			}
				
	%>
  	
  	 	
	
<!--  <div class="row"></div> -->
<!--   <div class="footer" style="text-align:center"> -->
<!--     <p>Copyrights - MyCare &copy; </p> -->
<!--   </div> -->

  <script>
    var header = document.getElementById("myDiv");
    var as = header.getElementsByClassName("a");
    for (var i = 0; i < as.length; i++) {
      as[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        if (current.length > 0) {
          current[0].className = current[0].className.replace(" active", "");
        }
        this.className += " active";
      });
    }

    $(function () {
      $("i").click(function () {
        $("i,span").toggleClass("press", 1000);
      });
    });
  </script>

</body>

</html>