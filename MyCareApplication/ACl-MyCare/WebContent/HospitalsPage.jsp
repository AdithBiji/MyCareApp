<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>


<!DOCTYPE>
<html>

<head>
<title>My Care - Hospitals</title>
<link rel="shortcut icon" href="acl.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/hospitals.css" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
	<ul>
		<div id="myDiv">
			<a href="HospitalsPage.jsp" target="_self"><button class="a active">Hospital</button></a>
			<a href="PharmacyPage.jsp" target="_self"><button class="a">Pharmacy</button></a>
			<a href="CommunityPage.jsp" target="_self"><button class="a">Community</button></a>
			<a href="MyList.html" target="_self"><button class="a">My List</button></a>
			<a href="Profile.jsp" target="_self"><button class="a">Profile</button></a>
		</div>
	</ul>
	<%		

			
				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT hosp_name,hosp_topline,hosp_img_url FROM hospitals");
			ResultSet resultSet = pstmt.executeQuery();
			
	%>
	<div class="row">

		<%	while(resultSet.next()){	  %>

		<div class="column">
			<a
				href="retrieve.jsp?hospName=<%=resultSet.getString("hosp_name") %>"
				style="text-decoration: none;">
				<div class="card">
					<img class="img"
						src="Images/Hospitals/CardImage/<%=resultSet.getString("hosp_img_url").concat(".jpg") %>"
						alt="Hospitam image">
					<h3><%=resultSet.getString("hosp_name") %></h3>
					<p><%=resultSet.getString("hosp_topline") %></p>
			</a> <i onclick="pop(this)"></i>
		</div>
	</div>

	<% } %>

	</div>
	
	<br><br><br><br>
	
	<%

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



	<div class="footer" style="text-align: center">
		<p>Copyrights - MyCare &copy;</p>
	</div>



	<script>
	 
	 function pop(x){
	      x.classList.toggle("fa-user-md");
	    }
	
	
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

    </script>

</body>

</html>