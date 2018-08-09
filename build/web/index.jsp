<%-- 
    Document   : index
    Created on : 23-jul-2018, 12:17:10
    Author     : Jhonatan Delgadillo Montano
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        

        <title>Index</title>
    </head>
    <body>
        <h1 > Listado de Clientes </h1>
        <hr>
        <%
            Connection conex = null;
            Statement sql = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conex = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpractica", "root", "");
                sql = conex.createStatement();
                //out.print("Conexion Establecida");
           } catch (Exception e) {           
                    out.print("Tienes el siguiente error: "+e);
           }
                // Empezamos a listar los datos de la tabla
                PreparedStatement ps;
                ResultSet rs;
                ps = conex.prepareStatement("SELECT * FROM clientes");
                rs = ps.executeQuery();
                // Creamos la tabla: 
        %>
        <div class="container buscar" >
            <form >
                  <a  href="Agregar.jsp" class="btn btn-success "> + Nuevo </a>
                <input  class="form-control-sm" type="text" name="txtbuscar"> 
                <input class="btn btn"  type="submit" value="Buscar">
            </form>
            <%
                    String nombuscar = request.getParameter("txtbuscar");
                    if (nombuscar != null) {
                         ps = conex.prepareStatement("SELECT * FROM clientes WHERE nombre LIKE" + "'%" + nombuscar + "%'");
                         rs = ps.executeQuery();
                    } else {
                        System.err.print("Error");
                    } 
                        
                %>
            <br>
            <br>
            <table class="table table-bordered table-sm">
                <tr >
                    <th class="text-center">ID</th>
                    <th class="text-center">NOMBRE</th>
                    <th class="text-center">DNI</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr >
                    <td class="text-center"><%=rs.getInt("id")%> </td>
                    <td class="text-center"><%=rs.getString("nombre")%> </td>
                    <td class="text-center"><%=rs.getString("dni")%> </td>                              
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%=rs.getInt("id")%>" class="btn btn-warning btn-sm"> Editar</a>                    
                        <a href="Delete.jsp?id=<%=rs.getInt("id")%>" class="btn btn-danger btn-sm" > Eliminar</a>                   
                    </td>            
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
