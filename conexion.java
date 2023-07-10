package conexion;

/**
 *
 * @author alex2
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {
    
    public static void main(String[] args) {
        obtenerConexion();
    }

    // Método que se encarga de cargar el driver de MySQL
    private static void conectar() {
        Connection con = null;
        String Driver="com.mysql.jdbc.Driver";
        try {
            Class.forName(Driver);
            System.out.println("Driver cargado con exito");  
        }
        catch (Exception e) {
            System.out.println("Ha ocurrido un error al cargar el Driver"+ e.getMessage());
        }
    }
    
    // Método que se encarga de obtener la conexión con la base de datos
    public static Connection obtenerConexion() {
        Connection con = null;
        
        try {
            conectar();
            // Se establece la conexión con la base de datos
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alex?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "12569655");
            System.out.println("Se ha establecido la conexión");
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error al obtener la conexión"+ e.getMessage());
        }
        return con;
    }
}
