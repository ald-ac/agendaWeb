package controlador;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*; //Necesarios 
import java.sql.*; //para sql

public class Modificar extends HttpServlet
{
      public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
        String mensaje = null; //Mensaje de notificacion
        String id=request.getParameter("id");
        String nombre=request.getParameter("nombre");
        String telefono=request.getParameter("telefono");
        String correo=request.getParameter("correo");

        //=================CREANDO QUERY DE MODIFICACION=================
        String query = "UPDATE contactos set nombre='" + nombre + "', telefono = '" + telefono + "', correo = '" + correo + "' where id = " + id;
        Connection conexion = null;
        String url = "jdbc:postgresql://127.0.0.1:5432/agenda"; //Establecer base de datos de insercion
        try {
          Class.forName("org.postgresql.Driver"); //Clase para conexion a postgres
          conexion = DriverManager.getConnection(url, "ald", "root"); //Parametros de conexion
          Statement inst = conexion.createStatement(); //Operacion a la base de datos
          inst.executeUpdate(query); //Solo se usa en operaciones que modifican la base de datos
          mensaje = "ACTUALIZACION EXITOSA";
          conexion.close();
        } catch(Exception e) {
          mensaje = "ACTUALIZACION FALLIDA";
        }
        request.setAttribute("MENSAJE", mensaje); //Mandar mensaje de notificacion
        RequestDispatcher vista=request.getRequestDispatcher("/index");
        vista.forward(request,response);
      }
}