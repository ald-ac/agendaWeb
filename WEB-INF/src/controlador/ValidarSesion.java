package controlador;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*; //Necesarios 
import java.sql.*; //para sql

public class ValidarSesion extends HttpServlet
{
      public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
        //Verificar si ya hay sesion del usuario, si no existe se intenta ver si es posible que el usuario exista y crearla
        HttpSession session = request.getSession(true);
        String usuario = (String)session.getAttribute("USUARIO");
        if(usuario == null)
        {
          //=================CREANDO QUERY DE CONSULTA=================
          Connection conexion = null;
          String url = "jdbc:postgresql://127.0.0.1:5432/agenda"; //Establecer base de datos de insercion
          try {
              String usuarioL = request.getParameter("usuario");
              String password = request.getParameter("password");
              String query = "SELECT * FROM usuarios WHERE usuario ='" + usuarioL + "' AND pass = '" + password + "';";
              Class.forName("org.postgresql.Driver"); //Clase para conexion a postgres
            conexion = DriverManager.getConnection(url, "ald", "root"); //Parametros de conexion
            Statement inst = conexion.createStatement(); //Operacion a la base de datos
            ResultSet rs = inst.executeQuery(query); //Almacena la respuesta 
            if(rs.next()) { //Si existe un registro con los datos ingresados, existe el usuario
              String usuarioF = rs.getString(2).trim();
              //Crear variables de sesion
              session.setAttribute("USUARIO", usuarioF);
              response.sendRedirect(request.getContextPath()+"/Inicio");
            } else { //Si no existe el usuario en la BD se redirige a index
              response.sendRedirect(request.getContextPath()+"/index.jsp");
            }
            conexion.close();
            inst.close();
          } catch(Exception e) {
          }
        } else { //Si hay sesion iniciada, no tiene caso verificar el usuario, dado que es obvio que existe
          response.sendRedirect(request.getContextPath()+"/Inicio");
        }
      }
}