<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*"
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             <%
  Connection conex= null;
  Statement sql= null;
  
          Class.forName("com.mysql.jdbc.Driver");
          conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpractica","root","");
          sql= conex.createStatement();
          //out.print("Conexion Establecida");
  
      // Empezamos listando los datos xd la tabla clientes pero de la fila seleccionada
      PreparedStatement ps;
      int id=Integer.parseInt(request.getParameter("id"));
      ps=conex.prepareStatement("DELETE FROM clientes WHERE id="+id);
      ps.execute();
      response.sendRedirect("index.jsp");
      
    %>
    </body>
</html>
