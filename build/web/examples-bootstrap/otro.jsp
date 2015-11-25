<%-- 
    Document   : otro
    Created on : Nov 23, 2015, 11:18:03 AM
    Author     : aiikarG
--%>

<%@page 
    contentType="text/html" pageEncoding="UTF-8" 
    import="java.sql.Connection"
    import="java.sql.DriverManager"
    import="java.sql.ResultSet"
    import="java.sql.Statement"
    import="java.sql.SQLException"
        %>
<%
    Connection conex=null;
    Statement sql=null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/restaurante","root","");
        sql = conex.createStatement();
        System.out.print("CONEXION ESTABLECIDA BITCH");
    }
    catch(Exception e){
        System.out.print("ERROR EN LA CONEXION BITCH " + e);
    }
    String nombre="";
    nombre = (String) request.getParameter("nombre");
    out.print(nombre);
    System.out.println(nombre);
%>