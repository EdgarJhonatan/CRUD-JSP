<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="java.sql.*"       
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Clientes</title>
    </head>
    <body>
    <%
  Connection conex= null;
  Statement sql= null;
  try {
          Class.forName("com.mysql.jdbc.Driver");
          conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpractica","root","");
          sql= conex.createStatement();
          //out.print("Conexion Establecida");
  
      // Empezamos listando los datos xd la tabla clientes pero de la fila seleccionada
      PreparedStatement ps;
      ResultSet rs;
      int id=Integer.parseInt(request.getParameter("id"));
      ps=conex.prepareStatement("SELECT * FROM clientes WHERE id="+id);
      rs=ps.executeQuery();
      while (rs.next()) {  
    %>
         <div class="container" >
        <h1>Modificar Clientes</h1>
        <hr>
        <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
            ID:
            <input type="text" readonly="" class="form-control" value="<%= rs.getInt("id")%>"/>
            NOMBRE:
            <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("nombre")%>" />
            DNI:
            <input type="text" name="txtDNI" class="form-control" value="<%= rs.getString("dni")%>"/>
            <br>
            <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
            <a href="index.jsp">Regresar</a>       
        </form>
        <%}%>
       </div>
    </body>
</html>
<%

 String nom, dni;
      nom= request.getParameter("txtNom"); 
      dni= request.getParameter("txtDNI"); 
      if(nom!=null && dni!=null) {
          ps= conex.prepareStatement("UPDATE  clientes SET nombre='"+nom+"',dni='"+dni+"' WHERE id="+id);
          ps.executeUpdate();
          response.sendRedirect("index.jsp");
      }
      } catch (Exception e) {           
          out.print("Tienes el siguiente error: "+e);
      }
%>