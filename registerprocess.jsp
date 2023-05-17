<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%!
    String name,mail,psw,psw1;
%>
<%
  //  out.println("hi sai");
    name=request.getParameter("uname");
    mail=request.getParameter("email");
    psw=request.getParameter("pwd");
    psw1=request.getParameter("pwd1");

    try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
		out.println("success connected");
        PreparedStatement pp = con.prepareStatement("insert into registers values(?,?,?)");
		out.println("entered values");
        pp.setString(1,name);
        pp.setString(2,mail);
        pp.setString(3,psw);
	  //pp.setString(4,psw1);
		out.println("hello");

	//Check the password and currentpassword
	  if(psw.equals(psw1)){
        	int f=pp.executeUpdate();
		out.println("hi");
        	//if(psw.equals(psw1))
            response.sendRedirect("/main_project/index.html");
	}
        else{
            response.sendRedirect("/main_project/signup.html");
		
	}
	
		 
	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>