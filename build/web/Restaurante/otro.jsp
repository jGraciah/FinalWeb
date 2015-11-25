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
        //System.out.print("CONEXION ESTABLECIDA");

        }
    catch(Exception e){
        //System.out.print("ERROR EN LA CONEXION " + e);
    }
    
   String nombre="";
   String paq1="";
   String paq2="";
   String paq3="";
   String tipo_comida="";
    
    nombre = (String) request.getParameter("nombre");
    paq1 = (String) request.getParameter("paquete1");
    paq2 = (String) request.getParameter("paquete2");
    paq3 = (String) request.getParameter("paquete3");
    tipo_comida = (String) request.getParameter("tipo");
    int a = Integer.parseInt(tipo_comida);
    
    out.print(nombre);
    out.print(paq1);
    out.print(paq2);
    out.print(paq3);
    out.print(a);
    
    System.out.println(nombre);
    System.out.println(paq1);
    System.out.println(paq2);
    System.out.println(paq3);
    System.out.println("esta es el tipo " + a);
    int suma=0;
    
    if(a == 1)
    {//es desayuno
        suma=0;
        
        if(paq1 == "true")
        {
            suma=suma+10;
        }
        if(paq2 =="true")
        {
            suma=suma+20;
        }
        if(paq3 =="true")
        {
            suma=suma+30;
        }
        sql.executeUpdate("insert into pedidos values(NULL,\""+nombre+"\",\""+suma+"\",\""+tipo_comida+"\")");
    }
    else if(a == 2)
    {//es comida
        suma=0;
        
        if(paq1 == "true")
        {
            suma=suma+10;
        }
        if(paq2 =="true")
        {
            suma=suma+20;
        }
        if(paq3 =="true")
        {
            suma=suma+30;
        }
        sql.executeUpdate("insert into pedidos values(NULL,"+nombre+","+suma+","+a+")");
    }
    else
    {
        System.out.println("No jala");
        //ya valio
    }
    
    ResultSet resultado =sql.executeQuery("select * from productos;");
    while (resultado.next()) {
    out.print(resultado.getInt("id_producto"));
    out.print(resultado.getString("nombre_producto"));
    }
%>