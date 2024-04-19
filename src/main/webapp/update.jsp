<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>


<%
     if (request.getParameter("add")!= null) {
    	 String Id = request.getParameter("Id");
 	    String bname = request.getParameter("bname");
	    String qty = request.getParameter("qty");
	    String price = request.getParameter("price");
	    String date = request.getParameter("date");

        Connection con = null;
        PreparedStatement pst = null;
        
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbreadmgt", "root", "");
        
        pst = con.prepareStatement("update tblbread set bname=?, qty=?, price=?, date =? where Id=?");
        pst.setString(1, bname);
		pst.setString(2, qty);
		pst.setString(3, price);
		pst.setString(4, date);
		pst.setString(5,Id);
        pst.executeUpdate();
      %>
      <script>
            alert("Record Updated!");
            window.location.href = "View.jsp";
        </script>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                }
            }
        %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Record</title>
<link rel="stylesheet" href="Home.css">
<link rel="stylesheet" href="css/bootstrap.css">
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
.btnRe{
color:black;
background-color: white;
padding:2px;
border-radius:3px;
border:1px solid black;
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
<div class="container-fluid card" style="width:40rem; margin: 1rem auto;">
<h1 class="bg-secondary text-white text-center">Update Record</h1>
<form method="post" action="#">
<table class="table table-hover">
   <%
   Connection con;
   PreparedStatement pst;
   ResultSet rs;

   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbreadmgt", "root", "");
   
   String Id = request.getParameter("Id");
   
   pst = con.prepareStatement("select * from tblbread where Id = ?");
   pst.setString(1, Id);
   rs = pst.executeQuery();
   
   while(rs.next())
   
   {
   %>
		<tr>
			<td>Name</td>
			<td><input type="text" name="bname" id="bname" value="<%= rs.getString("bname")%>" required></td>
		</tr>
		<tr>
			<td>Quantity</td>
			<td><input type="text" name="qty" id="qty" value="<%= rs.getString("qty")%>" required></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" name="price" id="price" value="<%= rs.getString("price")%>" required></td>
		</tr>
		<tr>
			<td>Date</td>
			<td><input type="text" name="date" id="date" value="<%= rs.getString("date")%>" required></td>
		</tr>
		<%
		
        }
		%>
		<tr>
			<td><input type="submit" value="Update" name="add" id="submit"></td>
			<td><input type="reset" value="Cancel" id="reset"></td>
			<td><a class="btnRe" href="View.jsp">Return</a></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>