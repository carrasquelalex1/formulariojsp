# formulariojsp
crear un formulario en JSP que permita seleccionar estado, municipio y parroquia. Los campos de estado, municipio y parroquia estarán anidados o dependeran jerarquicamente uno de otros.


Los campos de estado, municipio y parroquia estarán anidados, lo que significa que el valor seleccionado en el campo de estado afectará los valores disponibles en el campo de municipio, y el valor seleccionado en el campo de municipio afectará los valores disponibles en el campo de parroquia. Los datos ingresados en el formulario se guardarán en una tabla de una base de datos mysql, que contiene todas las tablas de este proyecto Java Web llamado "ac".

En Workbench se creó la base de datos Mysql llamada alex, la base de datos tiene 4 tablas llamadas estado, municipio, parroquia y principal. La tabla estado tiene dos columnas Estado y Codestado, La tabla municipio tiene tres columnas Municipio, Codmunicipio y Codestado, la tabla parroquia tiene cuatro columnas Parroquia, Codparroquia, Codmunicipio, Codestado. La tabla principal tiene las columnas Estado, Municipio, Parroquia

1) Se trabaja con el entorno de desarrollo Apache NetBeans al cual se agrega la libreria mysql-connector-java-8.0.11 y servido local Tomcat 9, el usuario para la conexion a la base de datos ac es root y la contraseña es 12569655.

2 ) Se crea un Java Packages llamado conexion con una archivo conexion.java para crear la conexion a la base de datos, se realiza la prueba de conexion y funciona perfectamente. 

Este código archivo conexion.java  se encarga de establecer una conexión a una base de datos MySQL.

Primero, se importan las clases necesarias para establecer la conexión. Luego, se define un método conectar() que carga el driver de MySQL. Si ocurre algún error al cargar el driver, se imprime un mensaje de error. El método obtenerConexion() es el que se encarga de establecer la conexión a la base de datos. Primero, llama al método conectar() para cargar el driver. Luego, se establece la conexión con la base de datos utilizando la clase DriverManager y se devuelve la conexión. Si ocurre algún error al obtener la conexión, se imprime un mensaje de error.

3) Creo el archivo index.jsp el cual tendra el formulario con los tres selectores de opciones anidados o dependientes. El primer selector muestra una lista de estados, el segundo selector muestra una lista de municipios correspondientes al estado seleccionado en el primer selector, y el tercer selector muestra una lista de parroquias correspondientes al municipio seleccionado en el segundo selector.

4) Creo el archivo municipio.jsp este código utiliza una conexión a una base de datos para obtener los municipios correspondientes a un estado y los muestra en una lista desplegable. recibe un parámetro "estado" y muestra una lista de municipios correspondientes a ese estado.

5) Creo el archivo parroquia.jsp El siguiente código es una página JSP que obtiene el estado y municipio seleccionados por el usuario y muestra una lista de parroquias correspondientes a esa selección. Este código obtiene los parámetros de estado y municipio seleccionados por el usuario, realiza una consulta SQL para obtener las parroquias correspondientes a esa selección y muestra una lista de opciones para cada parroquia. Finalmente, cierra los objetos ResultSet, Statement y Connection para liberar recursos.
