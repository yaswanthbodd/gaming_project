<%@ page import="java.sql.*"%>

<%!
    String name,mail,psw;
%>
<%
    mail=request.getParameter("email");
    psw=request.getParameter("pwd");

    try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
		out.println("success connected");
        Statement st= con.createStatement();

        ResultSet rs = st.executeQuery("select * from registers where email like '"+mail+"' and password like '"+psw+"'");
        if(rs.next())
            response.sendRedirect("/main_project/index.html");
        else
            response.sendRedirect("/main_project/login.html");

		 
	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>