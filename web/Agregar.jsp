<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*"
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Clientes</title>
    </head>
    <body>
        <div class="container" >
        <h1>Agregar Clientes</h1>
        <hr>
        <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
            NOMBRE:
            <input type="text" name="txtNom" class="form-control"/>
            DNI:
            <input type="text" name="txtDNI" class="form-control"/>
            <br>
            <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
            <a href="index.jsp">Regresar</a>       
        </form>
       </div>       
     </body>
</html>
<%
  Connection conex= null;
  Statement sql= null;
  try {
          Class.forName("com.mysql.jdbc.Driver");
          conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpractica","root","");
          sql= conex.createStatement();
          //out.print("Conexion Establecida");
      } catch (Exception e) {
          out.print("Error en la conexion");
          out.print(e);
      }
      PreparedStatement ps;
      String nom, dni;
      nom= request.getParameter("txtNom"); 
      dni= request.getParameter("txtDNI"); 
      if(nom!=null && dni!=null) {
          ps= conex.prepareStatement("INSERT INTO clientes(nombre, dni) VALUES ('"+nom+"','"+dni+"')");
          ps.executeUpdate();
          response.sendRedirect("index.jsp");
      }
      

%>
    
