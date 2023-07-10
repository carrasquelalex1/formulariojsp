  <%-- 
    Document   : parroquia
    Created on : 9 jul. 2023, 8:00:36 p. m.
    Author     : alex2
--%>

<%@page import="conexion.conexion"%>
<%@ page import="java.sql.*" %>

<%
    // Obtiene los parámetros de estado y municipio seleccionados por el usuario
    String estado = request.getParameter("estado");
    String municipio = request.getParameter("municipio");

    // Obtiene una conexión a la base de datos
    Connection con = conexion.obtenerConexion();

    // Crea un objeto Statement para ejecutar consultas SQL
    Statement stmt = con.createStatement();

    // Ejecuta una consulta SQL para obtener las parroquias correspondientes al estado y municipio seleccionados
    ResultSet rs = stmt.executeQuery("SELECT * FROM parroquia WHERE Codestado='" + estado + "' AND Codmunicipio='" + municipio + "'");

    // Itera sobre los resultados de la consulta y muestra una lista de opciones para cada parroquia
    while (rs.next()) {
      %>
      <option value="<%=rs.getString("Codparroquia")%>"><%=rs.getString("Parroquia")%></option>
      <%
    }

    // Cierra los objetos ResultSet, Statement y Connection para liberar recursos
    rs.close();
    stmt.close();
%>
