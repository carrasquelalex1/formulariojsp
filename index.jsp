<%-- 
    Document   : index
    Created on : 9 jul. 2023, 7:44:31 p. m.
    Author     : alex2
--%>

<%@page import="conexion.conexion"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    </head>
    <body>
        
        <% // Se obtiene la conexión a la base de datos
            Connection con = conexion.obtenerConexion();
        %>
        
        <h1>Alexander Carrasquel</h1>
        
        <form>
            <select id="estado" name="estado" onchange="cargarMunicipios()">
                <option value="">Seleccione un estado</option>
                <% 
                    // Se crea un objeto Statement y se ejecuta una consulta SQL para obtener los estados
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM estado");
                    // Se recorre el resultado de la consulta y se agregan las opciones al selector de estados
                    while (rs.next()) {
                %>
                <option value="<%=rs.getString("Codestado")%>"><%=rs.getString("Estado")%></option>
                <%
                    }
                    rs.close();
                    stmt.close();
                %>
            </select>

            <select id="municipio" name="municipio" onchange="cargarParroquias()">
                <option value="">Seleccione un municipio</option>
            </select>

            <select id="parroquia" name="parroquia">
                <option value="">Seleccione una parroquia</option>
            </select>
        </form>

        <script>
            function cargarMunicipios() {
                // Se obtiene el valor seleccionado en el selector de estados
                var estado = document.getElementById("estado").value;
                // Se crea un objeto XMLHttpRequest para hacer una solicitud asíncrona al servidor
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    // Si la solicitud se completó y se recibió una respuesta exitosa
                    if (this.readyState === 4 && this.status === 200) {
                        // Se actualiza el selector de municipios con la respuesta recibida
                        document.getElementById("municipio").innerHTML = this.responseText;
                        // Se resetea el selector de parroquias
                        document.getElementById("parroquia").innerHTML = "<option value=''>Seleccione una parroquia</option>";
                    }
                };
                // Se envía una solicitud GET al servidor para obtener los municipios correspondientes al estado seleccionado
                xmlhttp.open("GET", "municipio.jsp?estado=" + estado, true);
                xmlhttp.send();
            }

            function cargarParroquias() {
                // Se obtiene el valor seleccionado en el selector de estados
                var estado = document.getElementById("estado").value;
                // Se obtiene el valor seleccionado en el selector de municipios
                var municipio = document.getElementById("municipio").value;
                // Se crea un objeto XMLHttpRequest para hacer una solicitud asíncrona al servidor
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    // Si la solicitud se completó y se recibió una respuesta exitosa
                    if (this.readyState === 4 && this.status === 200) {
                        // Se actualiza el selector de parroquias con la respuesta recibida
                        document.getElementById("parroquia").innerHTML = this.responseText;
                    }
                };
                // Se envía una solicitud GET al servidor para obtener las parroquias correspondientes al estado y municipio seleccionados
                xmlhttp.open("GET", "parroquia.jsp?estado=" + estado + "&municipio=" + municipio, true);
                xmlhttp.send();
            }
        </script>
        
    </body>
</html>
