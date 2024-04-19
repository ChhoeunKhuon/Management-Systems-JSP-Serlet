<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Home.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>View Data</title>
</head>
<style>
p{
font-size: 2rem;
color: white;
font-weight:bold;
}
a{
font-size: 20px;
text-decoration:none;
color:white;
}
nav{
display: flex;
justify-content: space-between;
}
nav ul{
margin-top: 17px;
}
nav ul li{
display: inline;
border-radius: 6px;
background-color: blue;
padding:5px;
}
nav ul li:hover{
background-color:white;
}
button{
padding: 3px;
}
.a{
color:green;
}
.ax{
color:red;
}
</style>
<body>
<nav class="bg-danger">
<p style="font-size: 2rem;margin-left:10px">Berkely Management System</p>
<div style="margin-right:10px; margin-top:10px;">
<a href="Home.jsp">Home</a>
<a href="View.jsp">View</a>
<a href="login.jsp">LogOut</a>
</div>
</nav>
<div class="col-sm-8" style="margin:1rem auto; width:1000px;">
			<div class="panel-body" style="border: 1px solid black;">
				<table id="tblOrder" cellpadding="0" width="100%" class="table table-responsive table-bordered"> 
					<thead>
						<tr class="bg-secondary ">
							<th style="width:300px; color:white;">Bread Name</th>
							<th style="width:300px;color:white;">Quantity</th>
							<th style="width:300px;color:white;">Price</th>
							<th style="width:300px;color:white;">date</th>
							</tr>
							<%
							Connection con = null;
					        PreparedStatement pst = null;
					        ResultSet rs;
					        
					        Class.forName("com.mysql.jdbc.Driver");
					        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbreadmgt", "root", "");
					        
					        String query = "select * from tblbread";
					        Statement st = con.createStatement();
					        
					        rs = st.executeQuery(query);
					        
					        while(rs.next())
					        {
					        	String Id = rs.getString("Id");
					        	
							%> 
							
						<tr>
							<td><%=rs.getString("bname") %></td>
							<td><%=rs.getString("qty") %></td>
							<td><%=rs.getString("price") %></td>
							<td><%=rs.getString("date") %></td>
							<td><a class="a" href="update.jsp?Id=<%= Id %>">Update</a></td>
                            <td><a class="ax" href="delete.jsp?Id=<%= Id %>">Delete</a></td>
							
						</tr>
						
						          <%
						    
						    
					        }
						           %>
					</thead>
				
				</table>
			</div>
		</div>
</body>
</html>