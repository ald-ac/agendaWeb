package controlador;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;
import modelo.Contacto;

public class Consulta extends HttpServlet
{
  public void service(HttpServletRequest request, HttpServletResponse response) 
       throws ServletException, IOException
  {
    //Verificar si ya hay sesion del usuario, sino, no tiene caso hacer la consulta
    HttpSession session = request.getSession(true);
    String usuario = (String)session.getAttribute("USUARIO");
    if(usuario != null)
    {
      String mensaje = (String)request.getAttribute("MENSAJE"); //Mensaje que se recibe cuando se realiza alguna accion
      String url="jdbc:postgresql://127.0.0.1:5432/agenda"; //Se indica la localizacion de la BD
      Connection con=null; //Se declara el objeto Connection "con" con un valor nulo
      String query="SELECT * FROM contactos ORDER BY nombre"; //Declarando query que se va a ejecutar
      ArrayList L=new ArrayList(); //Se crea una lista para guardar los renglones o registros que se obtienen de la consulta
      try
      {    
        Class.forName("org.postgresql.Driver"); //Cargar el driver para la conexion desde el jar correspondiente
        con=DriverManager.getConnection(url,"ald","root"); //Se crea  la conexion usando el url y datos del usuario
        Statement inst=con.createStatement(); //Crea la sentencia o instruccion sobre la que se ejecutara el query
        ResultSet rs=inst.executeQuery(query); //Se ejecuta el query y se almacena la consulta res
        while (rs.next()) //Este codigo se ejecutara mientras haya un siguiente renglon en el resultado de la consulta
        {
          int id = rs.getInt(1); //Obtiene el campo 1 del renglon en INT
          String nombre = rs.getString(2).trim(); //Obtiene el campo 2 del renglon en STRING, con trim se quitan espacios en blanco antes o despues
          String telefono = rs.getString(3).trim(); //Obtiene el campo 3 del renglon en STRING
          String correo = rs.getString(4).trim(); //Obtiene el campo 4 del renglon en STRING
          Contacto C = new Contacto(); //Se crea un objeto Contacto de la clase Contacto
          C.setId(id); //Se asgina el ID al atributo ID del objeto C
          C.setNombre(nombre); //Se asigna el nombre al atributo nombre del objeto C 
          C.setTelefono(telefono); //Se asigna el telefono al atributo telefono del objeto C
          C.setCorreo(correo); //Se asigna el correo al atributo correo del objeto C
          L.add(C); //Se agrega a la lista el objeto C
        }
        con.close(); //Cerrar conexion de la base de datos
        inst.close(); //Cerrar la instruccion
      }
      catch(Exception exc)
      {
        
      }  
        request.setAttribute("CONTACTOS",L); //Guardar lista y etiquetarla con el atributo
        request.setAttribute("MENSAJE", mensaje); //Pasar el mensaje de la accion realizada a la vista
        request.getRequestDispatcher("inicio.jsp").forward(request, response); //El despachador envia al jsp salida, una solicitud y respuesta 
    } else { //Si no hay sesion iniciada
      response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
  }
} 