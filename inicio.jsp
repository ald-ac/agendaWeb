<% //Verificar si ya hay sesion del usuario
        String usuario=(String)session.getAttribute("USUARIO");
        if (usuario != null)
        {
%>

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
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <img src="images/logo.png" alt="logo">
        <p class="titulo">
            Agenda de Contactos
        </p>
        <div>
            <p class="nombreUsuario"><%= usuario%></p>
            <a class="btnSalir" href="cerrarSesion.jsp">SALIR</a> <!--Llamar JSP para cerrar sesion-->
        </div>
    </header>
    <main>
        <form class="insercion" action="<%=request.getContextPath()%>/Insertar" method="POST">
            <label>ID:</label>
            <input type="text" name="id" id="inputId" required pattern="[0-9]+" title="Solo números enteros">
            <label>Nombre:</label>
            <input type="text" name="nombre" required>
            <label>Teléfono:</label>
            <input type="tel" name="telefono" required pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="10 números enteros">
            <label>Email:</label>
            <input type="email" name="correo" required>
            <button type="submit" id="btnRegistrar">Registrar</button>
        </form>
        <div class="mensaje"><%= mensaje%></div>
        <div class="datosContenedor">
            <form action="<%=request.getContextPath()%>/Eliminar" method="POST">
                <table class="tablaDatos">
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
                        <td><input type="checkbox" name="idCheckbox" value="<%= C.getId()%>"></td> <!--Asignar id en value del chbox-->
                        <td><%= C.getId()%></td>
                        <td><%= C.getNombre()%></td>
                        <td><%= C.getTelefono()%></td>
                        <td><%= C.getCorreo()%></td>
                        <td>
                            <!--Generar enlace de formulario de modificacion de acuerdo a los valores de cada objeto(registro)-->
                            <a href="modificar.jsp?id=<%= C.getId() %>&nombre=<%= C.getNombre().replace(" ","+")%>&telefono=<%= C.getTelefono().replace(" ","+")%>&correo=<%= C.getCorreo().replace(" ","+")%>">
                                <p id="btnModificar">Modificar</p>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </table>
                <button type="submit" id="btnEliminar">Eliminar</button>
                </a>
            </form>
        </div>
    </main>
</body>

<script> 
    const mensaje = document.querySelector('.mensaje'); 
    const buton = document.querySelector('#btnRegistrar');
    //Cuando se carga index, revisar si existe alguna modificacion por parte de un controlador
    document.addEventListener("DOMContentLoaded", agregarMensaje);

    function agregarMensaje() {
        if(mensaje.textContent != "null"){
            mensaje.style.display = 'block'; //Mostrar mensaje solo 3 segundos
            setTimeout(function() {
            mensaje.style.display = 'none';
            window.location.replace("<%=request.getContextPath()%>/Inicio");
            }, 3000);
        }
    }
</script>
</html>

<% //Redirigir si no hay sesion
    }
    else
    {
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
%>