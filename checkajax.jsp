<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>
<%@ page errorPage="error.jsp"%>



<%@ page import="java.sql.*" %> 
<%
String name = request.getParameter("email").toString();
System.out.println(name);
String data ="";

private final String dbServer = "195.251.249.131";
private final String dbServerPort = "3306";
private final String dbName = "ismgroup96";
private final String dbusername = "ismgroup96";
private final String dbpassword = "frk7e4";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://" 
				+ dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from patients where email='"+email+"'");
int count=0;
while(rs.next())
{

count++;
}

if(count>0)
{
data="Email-ID already exists!";
}
else
{
data="You can register now!!!!";
}
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>