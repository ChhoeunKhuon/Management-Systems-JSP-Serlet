<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Berkeley System Management</title>
<link rel="stylesheet" href="Home.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
</style>
<body>
<nav class="bg-danger">
<p style="font-size: 2rem;margin-left:10px">Bakely Management System</p>
<div style="margin-right:10px; margin-top:10px;">
<a href="Home.jsp">Home</a>
<a href="View.jsp">View</a>
<a href="login.jsp">LogOut</a>
</div>
</nav>
<div class="container-fluid card" style="width:40rem; margin: 1rem auto;">

<h1 class="bg-secondary text-white text-center">Bakeley System Management</h1>
<form action="Data.jsp" method="post">
	<table class="table table-hover">
		<tr>
			<td>Name</td>
			<td><input type="text" name="bname" id="bname" required></td>
		</tr>
		<tr>
			<td>Quantity</td>
			<td><input type="text" name="qty" id="qty" required></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" name="price" id="price" required></td>
		</tr>
		<tr>
			<td>Date</td>
			<td><input type="text" name="date" id="date" required></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit" name="add" id="submit"></td>
			<td><input type="reset" value="Cancel" id="reset"></td>
		</tr>
	</table>
	<p>Welcome, <%=session.getAttribute("name")%></p>
</form>
</div>
</body>
</html>