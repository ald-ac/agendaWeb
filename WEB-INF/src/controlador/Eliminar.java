package controlador;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*; //Necesarios 
import java.sql.*; //para sql
import modelo.Contacto;

public class Eliminar extends HttpServlet
{
      public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {   
        //Verificar si ya hay sesion del usuario, sino, no tiene caso hacer la consulta
        HttpSession session = request.getSession(true);
        String usuario = (String)session.getAttribute("USUARIO");
        if(usuario != null)
        {  
          //Recibir checkbox de un formulario que han sido clickeados 
          String checkbox[] = request.getParameterValues("idCheckbox"); //Arreglo con values del checkbox
          String mensaje = null; //Mensaje de notificacion

          Connection conexion = null;
          String url = "jdbc:postgresql://127.0.0.1:5432/agenda"; //Establecer base de datos de eliminacion
          try {
            Class.forName("org.postgresql.Driver"); //Clase para conexion a postgres
            conexion = DriverManager.getConnection(url, "ald", "root"); //Parametros de conexion
            Statement inst = conexion.createStatement(); //Operacion a la base de datos
            //Solo se usa en operaciones que modifican la base de datos
            for(int i=0; i < checkbox.length; i++) { //Recorrer arreglo eliminando todos los recibidos de la bd
              inst.executeUpdate("DELETE FROM contactos WHERE id = " + checkbox[i]);
            }
            mensaje = "ELIMINACION EXITOSA";
            conexion.close();
          } catch(Exception e) {
            mensaje = "ELIMINACION FALLIDA";
          }
          request.setAttribute("MENSAJE", mensaje);
          RequestDispatcher vista=request.getRequestDispatcher("/Inicio");
          vista.forward(request,response);
        } else { //Si no hay sesion iniciada
          response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
      }
}