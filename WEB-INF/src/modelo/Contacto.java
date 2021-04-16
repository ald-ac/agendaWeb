package modelo;

public class Contacto {
    private int id;
    private String nombre;
    private String telefono;
    private String correo;

    public Contacto() {
        this.id = 0;
        this.nombre = "";
        this.telefono = "";
        this.correo = "";
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getId() {
        return this.id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public String getCorreo() {
        return this.correo;
    }
}