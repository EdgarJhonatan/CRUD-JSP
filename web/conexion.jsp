<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*"
        %>


<%
    // Validando conexión 
    Connection conex= null;
  Statement sql= null;
  try {
          Class.forName("com.mysql.jdbc.Driver");
          conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpractica","root","");
          sql= conex.createStatement();
          out.print("Conexion Establecida");
      } catch (Exception e) {
          out.print("Error en la conexion");
          out.print(e);
      }
    %>