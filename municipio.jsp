<%-- 
    Document   : municipio
    Created on : 9 jul. 2023, 8:00:36 p. m.
    Author     : alex2
--%>

<%@page import="conexion.conexion"%> <!-- Importa la clase "conexion" del paquete "conexion" -->
<%@ page import="java.sql.*" %> <!-- Importa todas las clases del paquete "java.sql" -->
<%
    String estado = request.getParameter("estado"); <!-- Obtiene el parámetro "estado" enviado por el cliente -->
    Connection con = conexion.obtenerConexion(); <!-- Obtiene una conexión a la base de datos utilizando la clase "conexion" -->
    Statement stmt = con.createStatement(); <!-- Crea un objeto "Statement" para ejecutar consultas SQL -->
    ResultSet rs = stmt.executeQuery("SELECT * FROM municipio WHERE Codestado='" + estado + "'"); <!-- Ejecuta una consulta SQL para obtener los municipios correspondientes al estado -->
    while (rs.next()) { <!-- Itera a través de los resultados de la consulta -->
      %>
      <option value="<%=rs.getString("Codmunicipio")%>"><%=rs.getString("Municipio")%></option> <!-- Crea una opción de selección para cada municipio encontrado -->
      <%
    }
    rs.close(); <!-- Cierra el objeto "ResultSet" para liberar recursos -->
    stmt.close(); <!-- Cierra el objeto "Statement" para liberar recursos -->
%>  
