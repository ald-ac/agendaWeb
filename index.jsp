<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <% //Verificar si ya hay sesion del usuario
        String usuario=(String)session.getAttribute("USUARIO");
        if (usuario==null)
        {
    %>
    <header>
        <img src="images/logo.png" alt="lo12go">
        <p class="titulo">
            Agenda de Contactos
        </p>
    </header>
    <main>
        <div class="sesionContenedor">
            <form class="formSesion" action="<%=request.getContextPath()%>/ValidarSesion" method="POST">
                <p class="tituloSesion">Iniciar sesion</p>
                <p>Usuario: </p>
                <input type="text" name="usuario">
                <p>Contraseña: </p>
                <input type="password" name="password"><br>
                <button class="btnSesion" type="submit">Entrar</button>
            </form>
        </div>
    </main>
    <%
        }
        else
        {
            response.sendRedirect(request.getContextPath()+"/Inicio");
        }
    %>
</body>
</html>