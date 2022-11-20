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
  		<title>MyCare - Community</title>
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  		<link rel="stylesheet" href="css/mycarecommunity.css" type="text/css">
	</head>

	<body>
  		<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
  		<ul>
   			 <div id="myDiv">
      				<a href="HospitalsPage.jsp" target="_self"><button class="a ">Hospital</button></a>
     					 <a href="PharmacyPage.jsp" target="_self"><button class="a">Pharmacy</button></a>
     					 <a href="CommunityPage.jsp" target="_self"><button class="a active">Community</button></a>
     					 <a href="MyList.html"><button class="a">My List</button></a>
      				<a href="Profile.html"><button class="a">Profile</button></a>
   			</div>
  		</ul>
  		
  		
 	<%		
			String medName = request.getParameter("medName");
			
				try{
			Connection conn = null;
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
 
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM communities where med_name=?");
			pstmt.setString(1, medName);
			ResultSet resultSet = pstmt.executeQuery();
			
			int wid=0;
			
			while(resultSet.next()){
				
				wid=Integer.parseInt(resultSet.getString("participants"))*2 ;
	%>

  		<div class="CommunityColumn">

    		<div class="participate"><i onclick="pop(this)" class="fa fa-line-chart"></i></div>
    		<div class="joined"><i onclick="pop1(this)" class="fa fa-user-circle-o"></i></div>
    		<img class="img" src="Images/Pharmacy/<%=resultSet.getString("comm_img_url").concat(".jpg") %>" alt="Hospitam image">
    			<h1 class="large-font"><%=resultSet.getString("med_category") %> - <%=resultSet.getString("med_name") %> Dispatcher Community</h1>
    		<div class="medium-font">Medicine: <%=resultSet.getString("med_name") %></div>
    		<div class="desc"><%=resultSet.getString("med_det_desc") %></div>
    		<br>
    		<div class="desc"><%=resultSet.getString("med_two_line_desc") %></div>
    		<div class="likes"><i class="fa fa-user-circle-o"> </i> <%=resultSet.getString("comm_members") %> Members </i></div>
    
     		 <div class="orgprice">Price: &#8377 1090 </div>
      			<div class="orgprice">Participator Price: &#8377 X </div>
      			<div class="orgprice">Community Price: &#8377 X </div>
    		<p class="hearttxt"> <i class="fa fa-line-chart"></i> <%=resultSet.getString("participants") %> Participators</p>
    
    	<div id="myProgress">
      			<div id="myBar" style="width: <%=wid %>%;"><%=resultSet.getString("participants") %>%</div>
   		 </div>
    			<p class="progstat">Progess to dispatch product until participants count hits 50...</p>
 		 </div>
 		 
 		 	
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
 		 
 		 
 		 
 		 

 		 <br>
  		<div class="footer" style="text-align:center">
    		<p>Copyrights - My Care &copy; 2020 </p>
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

            let clickings=0;
            function pop1(x)
            {
              clickings = clickings + 1;
                 x.classList.toggle("joined-red");

                  if(clickings % 2 == 0){
                    alert("Joined in Community!");
                  }
                  else{
                    alert("Exited Community!");
                  }
            }

  		</script>
		</body>

		</html>