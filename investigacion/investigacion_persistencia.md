# Taller Arquitectura y Bases de Datos
**Autor:** Kevin Puentes (20242578006)

---

## Tema 1 · El patrón Repository 

**1. ¿Qué es el patrón Repository (o DAO) y qué problema resuelve?** 
- Es una capa intermedia que actúa como una colección virtual en memoria para gestionar los datos. Resuelve el problema de acoplar la aplicación a una base de datos específica, permitiendo cambiar el motor de almacenamiento sin alterar la lógica de negocio ni el resto del código. 

**2. ¿Qué diferencia hay entre la capa de negocio (Service) y la capa de datos (Repository)? Den un ejemplo con una regla del RPG Manager.** 
- La capa *Service* maneja las reglas del juego y toma decisiones, mientras que *Repository* solo ejecuta operaciones de lectura y escritura en el almacenamiento. 
- **Ejemplo en el RPG Manager:** El servicio contiene las reglas que se siguen al momento de guardar (por ejemplo, a un guerrero), mientras que el patrón repository es lo que gestionaría nuestros personajes, sus objetos, etc. 

**3. ¿Por qué se dice que un Repository no debe validar reglas de negocio?**
- Porque su única responsabilidad es almacenar y recuperar información (en este caso, del RPG Manager). Si procesara lógica de negocio, se duplicaría código al cambiar de motor de datos.

---

## Tema 2 · Contratos en Java y Python 

**1. ¿Qué es una interface en Java? ¿Qué pasa si una clase que la implementa olvida un método?** 
- Es como un contrato que define qué métodos debe tener una clase sin especificar su implementación. Si una clase no implementa todos los métodos definidos, el código no compilará y arrojará un error. 

**2. ¿Qué es una clase abstracta con ABC y @abstractmethod en Python? ¿Qué pasa si intentan crear un objeto de esa clase?** 
- Es la forma en que Python define contratos utilizando el módulo `abc`, que establece qué debe tener nuestra clase para ser aceptada. Si se intenta instanciar la clase abstracta directamente (o una subclase sin implementar los métodos abstractos), Python lanzará un error (para eso se utiliza el decorador `@abstractmethod`). 

**3. ¿En qué se parecen y en qué se diferencian las dos formas?** 
- La diferencia principal es que Java lo detecta al compilar, mientras que Python lo valida en tiempo de ejecución al intentar instanciar la clase. 
- *Ejemplo:* Es cuando un usuario está creando su personaje (digamos tipo arquero) pero no llena todos los campos requeridos por el contrato (vida, nivel, etc.), el sistema no lo va a dejar guardar.

---

## Tema 3 · Inyección de dependencias por constructor 

**1. ¿Qué significa "programar contra una interfaz y no contra una implementación"?** 
- Significa hacer que una clase dependa de un contrato general (interfaz) y no de una clase concreta. Esto nos ayuda a poder hacer cambios a futuro sin modificar el código que ya tenemos, permitiendo hacer más cosas que si estuviéramos atados a una sola clase. 

**2. ¿Qué es la inyección de dependencias por constructor? Explíquenlo con un PersonajeService que necesita guardar personajes.** 
- Es cuando el constructor ayuda a crear o recibir las dependencias (clases) para que puedan existir, entregándoselas a la clase para que esta no tenga que instanciarlas por sí misma. En este caso, el `PersonajeService` no se crea completamente hasta que se le inyectan los parámetros a través del constructor, el cual ya tiene definido qué dependencias necesita.

**3. ¿Qué ventaja tiene que el Service reciba el repositorio en vez de crearlo él mismo?**
- Facilita cambiar la base de datos sin tocar la lógica del Service y permite realizar pruebas (testing) sustituyendo la base de datos por un simulador (mock).

---

## Tema 4 · Configuración y secretos 

**1. ¿Cómo se lee un archivo .properties en Java y un archivo ini en Python? Nombre la clase o el módulo que se usa.** 
- En **Java** se utiliza la clase `java.util.Properties`. 
- En **Python** se utiliza el módulo nativo `configparser`.

**2. ¿Para qué sirve gitignore y qué pasa si un archivo ya se subió antes de ignorarlo?** 
- Sirve para indicarle a Git qué archivos no debe rastrear ni subir. Si un archivo ya fue subido previamente, Git continuará rastreándolo aunque se añada al `.gitignore`. Para solucionarlo, se requiere eliminar el archivo de la caché de Git manualmente en el repositorio.

**3. Busquen un caso real de contraseñas o llaves filtradas en GitHub: qué pasó y qué consecuencias tuvo.** 
- En 2021, la plataforma Twitch sufrió una filtración masiva de código fuente en GitHub que incluía claves y secretos internos. Esto expuso datos confidenciales de la empresa, pagos a creadores y herramientas del sistema. 

---

## Tema 5 · MariaDB desde el código 

**1. ¿Qué es JDBC y qué hace un driver? ¿Qué librería cumple ese papel en Python para MariaDB?** 
- **JDBC** es la API estándar de Java para conectar con bases de datos relacionales, y el **driver** es el conector que traduce las peticiones al protocolo de la base de datos. En Python, la librería equivalente para MariaDB es `PyMySQL` o `mariadb`.

**2. ¿Qué es la inyección SQL? Muestren un ejemplo con el nombre de un personaje y expliquen por qué PreparedStatement (Java) o los parámetros %s (Python) la evitan.** 
- Es una vulnerabilidad que ocurre cuando se encadena texto introducido por un usuario directamente dentro de una consulta SQL, permitiendo ejecutar comandos maliciosos.
- *Ejemplo:* Si un usuario busca un personaje pero al final de su búsqueda añade sentencias SQL como `OR 1=1` o comandos adicionales, logra manipular la consulta en la base de datos.
- `PreparedStatement` en Java y los parámetros `%s` en Python separan la estructura SQL de los datos enviados, tratando la entrada del usuario únicamente como texto seguro y no como comandos ejecutables.

**3. ¿Qué es una transacción y qué hace commit()? ¿Qué pasa en PyMySQL si no se llama?** 
- Una **transacción** es un conjunto de operaciones de base de datos que se ejecutan como una sola unidad. 
- `commit()` guarda permanentemente los cambios en la base de datos.
- En `PyMySQL`, si no se llama a `commit()`, las operaciones no se conservan y los cambios se descartan (se hace un rollback implícito).

**4. ¿Por qué hay que cerrar las conexiones? ¿Qué es try-with-resources en Java y with en Python?**
- Las conexiones abiertas consumen memoria y recursos limitados en el servidor. `try-with-resources` (Java) y `with` (Python) son estructuras de control que garantizan el cierre automático de las conexiones y recursos al finalizar el bloque de código, incluso si ocurre un error.

---

## Tema 6 · MongoDB desde el código 

**1. ¿Qué es un ObjectId y qué información guarda por dentro?** 
- Es el identificador único de 12 bytes asignado por defecto a cada documento en MongoDB. Guarda en su estructura una marca de tiempo (timestamp), un identificador de proceso (máquina/proceso) y un contador incremental. 

**2. ¿En qué se parece un documento de MongoDB a un HashMap de Java o a un dict de Python?** 
- Todos organizan la información mediante la estructura de clave-valor (key-value), lo que permite almacenar, anidar y consultar datos estructurados mediante llaves descriptivas. 

**3. ¿Qué diferencia hay entre MongoDB local, MongoDB Atlas y mongoplayground.net? ¿Cuál de los tres puede usar un programa en Java o Python?**
- **MongoDB local** corre directamente en tu propia máquina.
- **MongoDB Atlas** es la versión administrada y alojada en la nube (cloud).
- **mongoplayground.net** es un entorno web interactivo solo para hacer pruebas rápidas. 
- Una aplicación en Java o Python puede conectarse para producción o desarrollo tanto a MongoDB local como a MongoDB Atlas.

---

## Tema 7 · ORM 

**1. ¿Qué es un ORM?** 
- Es una herramienta de software (Object-Relational Mapping) que mapea los registros y tablas de una base de datos relacional a objetos o clases dentro del lenguaje de programación. 

**2. Nombren uno de Java y uno de Python.** 
- En **Java** el estándar de facto es Hibernate (JPA). 
- En **Python** el más utilizado es SQLAlchemy (o Django ORM). 

**3. Den una ventaja y una desventaja de usar un ORM en lugar de escribir el SQL a mano.**
- **Ventaja:** Permite trabajar directamente con clases y objetos del código en lugar de escribir cadenas de consultas SQL manuales, agilizando mucho el desarrollo y mantenimiento.
- **Desventaja:** Puede generar consultas SQL ineficientes o lentas en operaciones muy complejas, reportes analíticos o manejo de grandes volúmenes de datos.

---

## Bibliografía

**Tema 1. El patrón Repository**
- https://martinfowler.com/eaaCatalog/repository.html

**Tema 2. Contratos en Java y Python**
- https://docs.oracle.com/javase/specs/jls/se12/html/jls-9.html
- https://docs.python.org/3/library/abc.html

**Tema 3. Inyección de dependencias por constructor**
- https://martinfowler.com/articles/injection.html

**Tema 4. Configuración y secretos**
- https://docs.oracle.com/en/java/javase/22/docs/api/java.base/java/util/Properties.html 
- https://docs.python.org/3/library/configparser.html
- https://git-scm.com/docs/gitignore
- Caso real de llaves filtradas (GitGuardian Security / Twitch Leak): https://blog.gitguardian.com/security-threats-from-the-twitch-leak/

**Tema 5. MariaDB desde el código**
- https://mariadb.com/kb/en/about-mariadb-connector-j/
- https://pymysql.readthedocs.io/en/latest/
- https://cheatsheetseries.owasp.org/cheatsheets/Injection_Prevention_Cheat_Sheet.html

**Tema 6. MongoDB desde el código**
- https://www.mongodb.com/docs/manual/reference/method/ObjectId/
- https://www.mongodb.com/docs/drivers/

**Tema 7. ORM**
- https://docs.hibernate.org/stable/orm/quickstart/html_single/
- https://docs.sqlalchemy.org/en/20/

---

## Uso de IA
- Le pedí ayuda a Gemini para que me explicara la pregunta uno, que era sobre "programar contra una interfaz", ya que no lo entendía bien.
- También, cuando había cosas de código que no había visto antes, le preguntaba para qué servían.
