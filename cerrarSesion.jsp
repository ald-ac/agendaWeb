<%
   String usuario = (String)session.getAttribute("USUARIO"); //Verificar que si hay una sesion
   if (usuario != null) //Si existe una sesion
   {
     session.setAttribute("USUARIO",null); //Se vuelve nula
   }
   response.sendRedirect("index.jsp"); //Si existe o no una sesion, aun asi se redirige a index
%> 