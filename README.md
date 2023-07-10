# formulariojsp
crear un formulario en JSP que permita seleccionar estado, municipio y parroquia. Los campos de estado, municipio y parroquia estarán anidados o dependeran jerarquicamente uno de otros.


Los campos de estado, municipio y parroquia estarán anidados, lo que significa que el valor seleccionado en el campo de estado afectará los valores disponibles en el campo de municipio, y el valor seleccionado en el campo de municipio afectará los valores disponibles en el campo de parroquia. Los datos ingresados en el formulario se guardarán en una tabla de una base de datos mysql, que contiene todas las tablas de este proyecto Java Web llamado "ac".

En Workbench se creó la base de datos Mysql llamada alex, la base de datos tiene 4 tablas llamadas estado, municipio, parroquia y principal. La tabla estado tiene dos columnas Estado y Codestado, La tabla municipio tiene tres columnas Municipio, Codmunicipio y Codestado, la tabla parroquia tiene cuatro columnas Parroquia, Codparroquia, Codmunicipio, Codestado. La tabla principal tiene las columnas Estado, Municipio, Parroquia

Se trabaja con el entorno de desarrollo Apache NetBeans y servido local Tomcat 9
