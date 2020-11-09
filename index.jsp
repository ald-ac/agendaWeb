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
    <link rel="stylesheet" type="text/css" href="Estilo.css">
</head>
<body>
    <header>
        <img src="images/logo.png" alt="logo">
        <p class="titulo">
            Agenda de Contactos
        </p>
    </header>
    <main>
        <form class="insercion" action="<%=request.getContextPath()%>/Insertar" method="POST">
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
        <div class="mensaje"><%= mensaje%></div>
        <div>
            <table>
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Telefono</th>
                    <th>Correo</th>
                    <th></th>
                </tr>
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
                    <td><button type="submit" id="btnModificar">MODIFICAR</button></td>
                </tr>
                <% } %>
            </table>
        </div>
    </main>
</body>
<script>
    const mensaje = document.querySelector('.mensaje');
    const buton = document.querySelector('#btnRegistrar');

    document.addEventListener("DOMContentLoaded", agregarMensaje);

    function agregarMensaje() {
        if(mensaje.textContent != "null"){
            mensaje.style.display = 'block';
            setTimeout(function() {
            mensaje.style.display = 'none';
            }, 3000);
        }
    }
</script>
</html>