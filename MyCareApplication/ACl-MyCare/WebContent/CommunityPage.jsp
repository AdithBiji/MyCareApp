
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
    			<title>My Care - Home</title>
    				<link rel="shortcut icon" href="acl.ico" type="image/x-icon">
    					<meta name="viewport" content="width=device-width, initial-scale=1">

    					<link rel="stylesheet" href="css/communitypage.css" type="text/css">

    						<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		</head>

		<body>
  				<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
  				<ul>
    				<div id="myDiv">
      					<a href="HospitalsPage.jsp" target="_self"><button class="a ">Hospital</button></a>
     					 <a href="PharmacyPage.jsp" target="_self"><button class="a">Pharmacy</button></a>
     					 <a href="CommunityPage.jsp" target="_self"><button class="a active">Community</button></a>
     					 <a href="MyList.html"><button class="a">My List</button></a>
      					<a href="Profile.jsp" target="_self"><button class="a">Profile</button></a>
   						 </div>
 				 </ul>
 				 
 				   <form class="search-box" action="/search.jsp" method="POST">
      					<input class="search-text" type="text" placeholder="Search.." name="search">
      					<button  class="search-btn" type="submit"><i class="fa fa-search"></i></button>
    			</form>
 				 <br><br>
 	<%		

			
				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM communities");
			ResultSet resultSet = pstmt.executeQuery();
			
			
			
			while(resultSet.next()){
				
			
	%>

    		
    		
    		
    		<div class="row">

        	<div class="column"> <!--Card Start-->
            <a href="SpecificCommunity.jsp?medName=<%=resultSet.getString("med_name") %>" style="text-decoration: none;">
            <div class="card">
              <img class="img" src="Images/Pharmacy/<%=resultSet.getString("comm_img_url").concat(".jpg") %>" alt="Hospitam image" >
              
              <div class="comminfo">
                  <h1><%=resultSet.getString("med_category") %> - <%=resultSet.getString("med_name") %> Dispatcher Community</h1>
                    <h3>Medicine : <%=resultSet.getString("med_name") %></h3>
<%--                   <p><%=resultSet.getString("med_two_line_desc") %></p> --%>
              	</a>
              	<i class="fa-user-circle-o"></i><p class="members"><%=resultSet.getString("comm_members") %> Members</p> 
              	<i class="fa-line-chart" title="Participate" onclick="pop(this);"></i>
              	<button class="joincomm">Join Community</button> 
              	</div>
            	</div>

          </div> <!--Card End-->


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
          
            

        

          
          

          <!-- Cards can be added within this -->
        </div>
   
    </div>

    <br><br><br>
    <br><br><br>

    <div class="footer" style="text-align:center">
        <p>Copyrights - MyCare &copy;  </p>
    </div>



      <script>
        
        let clicks=0;
            function pop(x)
            {
                clicks = clicks + 1;
                 x.classList.toggle("fa-line-chart-red");

                  if(clicks % 2 == 0){
                    alert("Participation Canceled!");
                  }
                  else{
                    alert("Participation Added!");
                  }

                  
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