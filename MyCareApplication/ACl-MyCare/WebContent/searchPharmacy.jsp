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


  		<link rel="stylesheet" href="css/pharmacypage.css" type="text/css">


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

	<body>
  		<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
  			<ul>
    				<div id="myDiv">
      					<a href="HospitalsPage.jsp" target="_self"><button class="a ">Hospital</button></a>
      					<a href="PharmacyPage.jsp" target="_self"><button class="a active">Pharmacy</button></a>
      					<a href="CommunityPage.jsp" target="_self"><button class="a">Community</button></a>
      					<a href="MyList.html"><button class="a">My List</button></a>
      					<a href="Profile.jsp" target="_self"><button class="a">Profile</button></a>
    				</div>
 			 </ul>
 			 
 			 <form class="search-box" action="searchPharmacy.jsp" method="POST">
      					<input class="search-text" type="text" placeholder="Search.." name="search">
      					<button  class="search-btn" type="submit"><div class="fa fa-search" style="background:none; color:white; margin-top:-1vw; marign-bottom:1vw" ></div></button>
    		</form>
 			<br><br>
 			 
 	<%		
 			String prodName = request.getParameter("search"); 

				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products where prod_name=? ");
			pstmt.setString(1, prodName);
			
			int i = pstmt.executeUpdate();
			ResultSet resultSet = pstmt.executeQuery();


			if(i==0){
				%><br><br><br> <h1 style="font-size:2vw; text-align:center;">No Results Found! &#9785;</h1> 
				
				<br><br><br><br><br><br><br><br><%
			}


			
			
			
				while(resultSet.next()){
					
	%>
	
	<div class="column">
    	<div class="card">
    	<a href="product.jsp?name=<%=resultSet.getString("prod_name") %>" style="text-decoration: none;">
      		<img class="img" title="Click to expand." src="Images/Pharmacy/<%=resultSet.getString("prod_img_url").concat(".jpg") %>" >
      		<h1 style="text-transform: capitalize; "><%=resultSet.getString("prod_name") %></h1>
     		 <p><%=resultSet.getString("prod_two_line_desc") %></p>
     	</a>
      		<i onclick="pop(this)" title="Like to place order."></i>
      		<i onclick="pop2(this)" class="c" title="Add to Cart Under, Find under Profile."></i>
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
  	
  	 	
	
 <div class="row"></div>
  <div class="footer" style="text-align:center">
    <p>Copyrights - MyCare &copy; </p>
  </div>

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