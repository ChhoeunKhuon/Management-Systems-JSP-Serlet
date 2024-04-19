<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%
     if (request.getParameter("add")!= null) {
 	    String bname = request.getParameter("bname");
	    String qty = request.getParameter("qty");
	    String price = request.getParameter("price");
	    String date = request.getParameter("date");

        Connection con = null;
        PreparedStatement pst = null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbreadmgt", "root", "");
        pst = con.prepareStatement("INSERT INTO tblbread (bname, qty, price, date) VALUES (?,?,?,?)");
        pst.setString(1,bname);
		pst.setString(2,qty);
		pst.setString(3,price);
		pst.setString(4,date);
        pst.executeUpdate();
        pst.close();
        con.close();
      %>
      <script>
            alert("Record added successfully!");
            window.location.href = "Home.jsp";
        </script>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                }
            }
        %>
        