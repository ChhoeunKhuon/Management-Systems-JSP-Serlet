<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%
    	String Id = request.getParameter("Id");
        Connection con;
        PreparedStatement pst = null;
        ResultSet rs;
        
        try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbreadmgt", "root", "");
        pst = con.prepareStatement("DELETE FROM tblbread WHERE Id = ?");
		pst.setString(1,Id);
        pst.executeUpdate();
        
      %>
      <script>
            alert("Record Deleted!");
            window.location.href = "View.jsp";
        </script>
        <%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
       %>