<% //Verificar si ya hay sesion del usuario
        String usuario=(String)session.getAttribute("USUARIO");
        String id = (String)request.getParameter("id");
        if (usuario != null && id != null) //Tambien se valida que nos e acceda al modificar.jsp directamente sin parametros
        {
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    id.replace('+', ' ');
    String nombre = (String)request.getParameter("nombre");
    nombre.replace('+', ' ');
    String telefono = (String)request.getParameter("telefono");
    String correo = (String)request.getParameter("correo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar</title>
    <link rel="stylesheet" href="style.css">
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
    <form action="<%=request.getContextPath()%>/Modificar" method="POST">
        <main class="container">
            <p class="tituloModificar">Modificar Contacto</p>
                <table class="formModificar">
                    <tr>
                        <td>ID:</td>
                        <td> <input type="text" name="id" value=<%=id %> readonly=readonly> </td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td> <input type="text" name="nombre" value="<%=nombre %>" ></td>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td><input type="text" name="telefono" value="<%=telefono %>" ></td>
                    </tr>
                    <tr>
                        <td>Correo:</td>
                        <td><input type="text" name="correo" value="<%=correo %>" ></td>
                    </tr>
                </table>
            <button type="submit" id="btnMod">MODIFICAR</button>
        </main>
    </form>
</body>
</html>
<% //Redirigir si no hay sesion
    }
    else
    {
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
%>