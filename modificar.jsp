<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = (String)request.getParameter("id");
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
    <link rel="stylesheet" href="Estilo.css">
</head>
<body>
    <header>
        <img src="images/logo.png" alt="logo">
        <p class="titulo">
            Agenda de Contactos
        </p>
    </header>
    <form action="<%=request.getContextPath()%>/Modificar" method="POST">
        <main class="container">
            <p class="tituloModificar">Modificar Contacto</p>
                <table class="formModificar">
                    <tr>
                        <td>ID:</td>
                        <td> <input class="prueba" type="text" name="id" value=<%=id %> readonly=readonly> </td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td> <input type="text" name="nombre" value=<%=nombre %> ></td>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td><input type="text" name="telefono" value=<%=telefono %> ></td>
                    </tr>
                    <tr>
                        <td>Correo:</td>
                        <td><input type="text" name="correo" value=<%=correo %> ></td>
                    </tr>
                </table>
            <button type="submit" id="btnMod">MODIFICAR</button>
        </main>
    </form>
</body>
</html>