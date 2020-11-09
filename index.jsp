<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "modelo.Contacto" %>

<% //Recibiendo datos de controladores
    ArrayList L = (ArrayList)request.getAttribute("CONTACTOS"); //Recibiendo lista de la consulta
    String mensaje = (String)request.getAttribute("MENSAJE"); //Recibir mensaje de notificacion de alguna accion
    Contacto C=null; //Objeto para acceder a datos
    Iterator i = L.iterator(); //Iterador para recorrer lista
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <img src="images/logo.png" alt="logo">
        <p class="titulo">
            Agenda de Contactos
        </p>
    </header>
    <main>
        <form class="insercion" action="">
            <label>ID:</label>
            <input type="text" name="id" id="id">
            <label>Nombre:</label>
            <input type="text" name="nombre">
            <label>Teléfono:</label>
            <input type="tel" name="telefono">
            <label>Email:</label>
            <input type="email" name="correo">
            <button type="submit" id="btnRegistrar">REGISTRAR</button>
        </form>
        <div class="data">
            <table>
                <%
                    while(i.hasNext()) { 
                    C = (Contacto)i.next(); //Extraer todos los objetos(contactos) de la lista
                %>
                <tr>
                    <td><input type="checkbox" name="eliminar"></td>
                    <td><%= C.getId()%></td>
                    <td><%= C.getNombre()%></td>
                    <td><%= C.getTelefono()%></td>
                    <td><%= C.getCorreo()%></td>
                    <td><button type="submit">MODIFICAR</button></td>
                </tr>
                <% } %>
            </table>
        </div>
    </main>
</body>
</html>