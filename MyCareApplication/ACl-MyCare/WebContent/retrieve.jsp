<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>

		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.PreparedStatement" %>
		
		<%
					
		%>
		<!DOCTYPE html>
		<html>
		<head>
		<title>My Care - Hospitals</title>
		<link rel="shortcut icon" href="acl.ico" type="image/x-icon">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="css/testmyhospitalsheet.css" type="text/css">

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<style>
/* ---------------CHAT POP-UP-------------- */




.open-button {
  border: none;
color: white;
padding: .8vw 1vw;
float: right;
font-size: 1vw;
border-radius: 5px;
margin-top: 1vw;
transition: transform .2s;
font-family: poppins-regular;
cursor: pointer;
background-color: #4CAF50;
width: 13vw;
}
.open-button:hover{
transition-duration: .5s; 
transform: scale(1.1);
}

/* The popup chat - hidden by default */
.chat-popup {
display: none;
position: fixed;
bottom: 0;
right: 15px;
border: 3px solid #f1f1f1;
/* z-index: 9; */
}

/* Add styles to the form container */
.form-container {
max-width: 300px;
padding: 10px;
background-color: white;
}

/* Full-width textarea */
.form-container textarea {
width: 100%;
padding: 15px;
margin: 5px 0 22px 0;
border: none;
background: #f1f1f1;
resize: none;
min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
background-color: #ddd;
outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
background-color: #4CAF50;
color: white;
padding: 16px 20px;
border: none;
cursor: pointer;
width: 100%;
margin-bottom:10px;
opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
opacity: 1;
}


/*Heat option on Hospital info*/
i {
  cursor:pointer;
  font-size: 2vw;
  margin-left: -450px;
  position: absolute;
  padding:1vw 1vw .7vw;
  background: #ddd7d7;
  border-radius:30vw;
  display:inline-block;
  color:rgb(255, 255, 255);
  transition:.2s;
}

i:hover {
  color:rgb(122, 228, 60);
}

i:before {
  font-family:fontawesome;
  content:'\f0f0';
  font-style:normal;
}

i:press{
  animation: size -.4s;
  color:rgb(122, 228, 60);
}

.fa-red-heart{
  cursor:pointer;
  padding:10px 12px 8px;
  background: #ddd7d7;
  border-radius:50%;
  display:inline-block;
  margin-left: -450px;
  position: absolute;
  color:rgb(236, 42, 42);
  transition:.2s;
}
.fa-user-md{
  cursor:pointer;
  padding:10px 12px 8px;
  background: #ddd7d7;
  border-radius:50%;
  display:inline-block;
  margin-left: -450px;
  position: absolute;
  color:rgb(122, 228, 60);
  transition:.2s;
}


</style>
		
		</head>
		<body>
		
		<img src="Images/mycare.jpg" alt="Header Logo" class="mycare">
		<ul>  
		<div id="myDiv">
  		<a href="HospitalsPage.jsp" target="_self"><button class="a active">Hospital</button></a>
     	<a href="PharmacyPage.jsp" target="_self"><button class="a">Pharmacy</button></a>
     	<a href="CommunityPage.jsp" target="_self"><button class="a ">Community</button></a>
     	<a href="MyList.html"><button class="a">My List</button></a>
  		<button class="a">My List</button>
  		<button class="a">Profile</button>
		</div>
		</ul>
		
		
		<%
		
		String hospName = request.getParameter("hospName");
		String imgUrl;
		try{
			Connection conn = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "acl", "arun");
         
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM hospitals WHERE hosp_name=?");
			pstmt.setString(1, hospName);
			
			ResultSet resultSet = pstmt.executeQuery();
		while(resultSet.next()){
			imgUrl=resultSet.getString("hosp_img_url").concat(".jpg");
// 			imgUrl="miot.jpg";
			
		%>
					
	<div class="container "> 
	
	
    
    <div class="row">
      <div class="column-66">
        <img class="bigimg" src="Images/Hospitals/CardImage/<%=imgUrl %>" alt="Hospital Image" >
        </div>
        <div class="infocolumn">
          <h1 class="xlarge-font"><b><%=resultSet.getString("hosp_name") %></b></h1>
          <h1 class="large-font" ><b><%=resultSet.getString("hosp_topline") %></b></h1>
          <p ><%=resultSet.getString("hosp_para1") %></p>
          <p ><%=resultSet.getString("hosp_para2") %></p>
          <p ><%=resultSet.getString("hosp_para3") %></p>
          <br><br>

          
		<%
				}
		
			conn.close();
		}
		catch (Exception e) {
			
			%>
			
			<script type="text/javascript">
				alert('Error Occured');	
			</script>
			
			<%
			
		}
		finally{
			
		}
		%>
          
          
          
            <div class="row">
              <button class="optbutton" onclick="document.getElementById('id01').style.display='block'" >Book Consultation</button>

              <div id="id01" class="modal">
                
                
                <form id="form" class="modal-content" >
                  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                  
                  <div class="container1">
                    <h1 class="topline">Book an Appointment</h1>
                    <p class="toppara">Please fill the details to create an appointment.</p>
                    <hr>
                    <label for="Name"><b>Name</b></label>
                    <input type="text" placeholder="Name" name="Name" required>
                    <label for="Age"><b>Age</b></label>
                    <input type="number" placeholder="Age" style="width: 100px;" >
                    <br><br>
                    <label for="date"><b>Appiontment Date</b></label>
                    <input type="date" >
                    <label for="Age"><b>Time</b></label>
                    <input type="time" placeholder="Age" style="width: 100px;" >
                    <br><br>
                    
                    
                    <label for="number"><b>Phone Number</b></label>
                    <input type="text" placeholder="Enter Phone Number" name="psw" required>
              
                    <button class="otp" onclick="myFunction()" >Get OTP</button></p>
                    <div class="otpsent"id="mydiv"></div>
                              

                    <input type="text" placeholder="Enter sent OTP" name="psw-repeat" required>
                    
                    
              
                    <div class="clearfix">
                      
                      <button   onclick="showSnackbar()" class="bookbtn" > Book Consultation</button>
                      <button  onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                      <div id="snackbar">check the details..</div>
                      
                    </div>
                  </div>
                  
                </form>

                
              </div>
              
              </div><br>
              <button class="optbutton" >Chat with Doctor</button>
              <!-- <div id="snackbar">Some text some message..</div>   -->

              <i onclick="pop(this)"></i>

            </div>
    </div>
   
    
    
  </div>

<!--   <div class="recents"> Your Recent Visits...</div> -->


<!--   <div class="recentrow"> -->
<!--     <div class="recentcolumn"> -->
<!--       <div class="recentcard"> -->
<!--         <h3>Hospital name</h3> -->
<!--         <p>Recent Information</p> -->
<!--         <p>Recent Information</p> -->
<!--       </div> -->
<!--     </div> -->

<!--     <div class="recentcolumn"> -->
<!--       <div class="recentcard"> -->
<!--         <h3>Recent Hospital name</h3> -->
<!--         <p>Recent Information</p> -->
<!--         <p>Recent Information</p> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="recentcolumn"> -->
<!--       <div class="recentcard"> -->
<!--         <h3>Recent Hospital name</h3> -->
<!--         <p>Recent Information</p> -->
<!--         <p>Recent Information</p> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->






  <div class="footer" style="text-align:center">
    <p>Copyrights - My Care &copy;   2020 </p>
</div>

<script>
    // Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        
    }
}

window.onload = function () {
  var form = document.getElementById('form');
  form.button.onclick = function (){
    for(var i=0; i < form.elements.length; i++){
      if(form.elements[i].value === '' && form.elements[i].hasAttribute('required')){
        alert('There are some required fields!');
        return false;
      }
    }
    form.submit();
  }; 
};

function onSubmit(){
  alert('Appointment Booked!');
}
function myFunction() {
  var x = document.getElementById("mydiv");
  if (x.innerHTML === "") {
   x.innerHTML = "OTP Sent!";
  } else {
    x.innerHTML = "";
  }
}
  
function showSnackbar() {
  
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 1000);
  
}

function pop(x){
      x.classList.toggle("fa-user-md");
    }
</script>

		
		</body>
		</html>		