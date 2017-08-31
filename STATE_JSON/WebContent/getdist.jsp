<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try
{

JSONArray ja=new JSONArray();
JSONObject jo;
String state=request.getParameter("statekey");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/state_json","root","sa");
Statement st=con.createStatement();

String s="select dist from state where state='"+state+"'";
ResultSet rs=st.executeQuery(s);

while(rs.next())
{
	jo=new JSONObject();
	String dist=rs.getString("dist");
	jo.put("distkey",dist);
	ja.add(jo);

	
}


out.println(ja); 
}
catch(Exception e)
{
	System.out.println(e);	
}



%>