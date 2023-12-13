# EJERCICIOS PYTHON

## Lección 1: Introducción a Python y Configuración del Entorno

### Creación de un Proyecto en Python:

Cuando trabajas en Python, es una buena práctica organizar tu código en proyectos. Aquí hay una guía simple para crear un proyecto en Python:

1. **Crear un Directorio del Proyecto:**

   - Abre tu terminal o línea de comandos.

   - Navega al directorio donde deseas crear tu proyecto.

   - Ejecuta el comando para crear un nuevo directorio, por ejemplo:

     ```bash
     mkdir MiProyecto
     cd MiProyecto
     ```

2. **Inicializar un Entorno Virtual:**

   - Dentro del directorio de tu proyecto, crea un entorno virtual. Puedes usar `venv` o `virtualenv`. Ejemplo:

     ```bash
     python -m venv venv
     ```

3. **Activar el Entorno Virtual:**

   - En sistemas basados en Unix/Linux/Mac, usa:

     ```bash
     source venv/bin/activate
     ```

   - En Windows, usa:

     ```bash
     .\venv\Scripts\activate
     ```

     Nota: Cuando el entorno virtual está activado, verás el nombre del entorno en tu terminal.

4. **Crear un Archivo `.py`:**

   - Dentro del directorio del proyecto, crea un archivo Python. Por ejemplo, puedes usar un editor de texto o un entorno de desarrollo integrado (IDE) como VSCode o PyCharm. Guarda el archivo con la extensión `.py`.

5. **Ejecutar el Archivo `.py`:**

   - Con el entorno virtual activado, puedes ejecutar tu archivo Python desde la terminal:

     ```bash
     python nombre_del_archivo.py
     ```

     Esto ejecutará el código contenido en el archivo.

6. **Desactivar el Entorno Virtual:**

   - Cuando hayas terminado, puedes desactivar el entorno virtual con el comando:

     ```bash
     deactivate
     ```

Este proceso proporciona un entorno aislado para tu proyecto, lo que facilita la gestión de dependencias y evita conflictos entre proyectos.

---

## Lección 2: Fundamentos de Python



### Nivel Básico

#### Ejercicio 1: Saludo Personalizado

**Objetivo:**

- Solicitar al usuario ingresar su nombre y mostrar un saludo personalizado.

**Ayuda:**

- Utiliza la función `input()` para solicitar el nombre del usuario.
- Combina el nombre ingresado en una cadena de saludo personalizada.

---

#### Ejercicio 2: Par o Impar

**Objetivo:**
- Solicitar al usuario ingresar un número y mostrar si es par o impar.

**Ayuda:**
- Utiliza la función `input()` para obtener un número del usuario.
- Usa una estructura condicional (`if`, `else`) y el operador de módulo (`%`) para determinar si el número es par o impar.

---

#### Ejercicio 3: Suma de Dos Números

**Objetivo:**
- Solicitar al usuario ingresar dos números y mostrar la suma.

**Ayuda:**
- Pide dos números al usuario con `input()`.
- Suma los números y muestra el resultado.

---

#### Ejercicio 4: Número Positivo o Negativo

**Objetivo:**
- Solicitar al usuario ingresar un número y mostrar si es positivo o negativo.

**Ayuda:**
- Pide al usuario que ingrese un número.
- Utiliza una estructura condicional para verificar si es positivo o negativo.

---

#### Ejercicio 5: Mayor de Edad

**Objetivo:**
- Solicitar al usuario ingresar su edad y mostrar si es mayor de edad.

**Ayuda:**
- Pide al usuario que ingrese su edad.

- Utiliza una estructura condicional para determinar si es mayor de edad.

  

### Nivel Intermedio

#### Ejercicio 6: Mayor de Tres Números

**Objetivo:**
- Solicitar al usuario ingresar tres números y mostrar el mayor.

**Ayuda:**
- Pide al usuario que ingrese tres números.
- Utiliza condicionales (`if`, `elif`, `else`) para comparar y mostrar el mayor.

---

#### Ejercicio 7: Área de un Triángulo

**Objetivo:**
- Solicitar al usuario la base y la altura de un triángulo y calcular su área.

**Ayuda:**
- Solicita la base y la altura con `input()`.
- Calcula el área con la fórmula: `(base * altura) / 2`.

---

#### Ejercicio 8: Número Primo

**Objetivo:**
- Solicitar al usuario ingresar un número y determinar si es primo.

**Ayuda:**
- Pide al usuario que ingrese un número.
- Utiliza un bucle y condicionales para verificar si es primo.

---

#### Ejercicio 9: Longitud de una Cadena

**Objetivo:**
- Solicitar al usuario ingresar una cadena y mostrar su longitud.

**Ayuda:**
- Utiliza `input()` para obtener una cadena del usuario.
- Usa la función `len()` para determinar la longitud.

---

#### Ejercicio 10: Cajero Automático

**Objetivo:**
- Simular un cajero automático restando el monto ingresado por el usuario del saldo.

**Ayuda:**
- Establece un saldo inicial.

- Resta el monto ingresado por el usuario al saldo.

  

### Nivel Avanzado

#### Ejercicio 11: Números Pares en una Lista

**Objetivo:**
- Generar una lista de números aleatorios y mostrar solo los números pares.

**Ayuda:**
- Utiliza funciones de generación de números aleatorios y listas.
- Implementa un bucle para iterar sobre la lista y muestra solo los números pares.

---

#### Ejercicio 12: Juego de Ahorcado

**Objetivo:**
- Elegir una palabra al azar y permitir al usuario intentar adivinarla.

**Ayuda:**
- Utiliza una lista de palabras.
- Implementa un bucle y condicionales para permitir que el usuario adivine la palabra.

---

#### Ejercicio 13: Palabras que Comienzan con 'a'

**Objetivo:**
- Solicitar al usuario ingresar una cadena y mostrar las palabras que comienzan con 'a'.

**Ayuda:**
- Pide al usuario que ingrese una cadena.
- Separa la cadena en palabras y muestra aquellas que comienzan con 'a'.

---

#### Ejercicio 14: Factorial de un Número

**Objetivo:**
- Solicitar al usuario ingresar un número y calcular su factorial.

**Ayuda:**
- Pide al usuario que ingrese un número.
- Utiliza un bucle para calcular el factorial del número.

---

#### Ejercicio 15: Promedio de una Serie de Números

**Objetivo:**
- Solicitar al usuario ingresar una serie de números y mostrar el promedio.

**Ayuda:**
- Pide al usuario que ingrese una serie de números.
- Calcula el promedio de esos números.

### Nivel Básico

#### Ejercicio 1: Listas y Acceso a Elementos

**Objetivo:**
- Crea una lista de tus colores favoritos.
- Accede al segundo color de la lista e imprímelo.

**Ayuda:**
- Utiliza corchetes `[]` para definir una lista de colores.
- Accede al segundo elemento utilizando índices.

---

#### Ejercicio 2: Añadir y Eliminar Elementos en Listas

**Objetivo:**
- Añade un nuevo color a tu lista de colores favoritos.
- Elimina el primer color de la lista.

**Ayuda:**
- Utiliza `append()` para agregar un nuevo color.
- Usa `pop()` o `remove()` para eliminar un color específico.

---

#### Ejercicio 3: Tuplas

**Objetivo:**
- Crea una tupla con las edades de tus tres amigos.
- Imprime la edad del segundo amigo.

**Ayuda:**
- Define una tupla utilizando paréntesis `()`.

---

#### Ejercicio 4: Diccionarios

**Objetivo:**
- Crea un diccionario con información sobre tu película favorita.
- Accede e imprime el director de la película.

**Ayuda:**
- Utiliza llaves `{}` para definir un diccionario.
- Asigna valores a claves para representar información.

---

#### Ejercicio 5: Conjuntos

**Objetivo:**
- Crea dos conjuntos con tus asignaturas favoritas este semestre y el semestre pasado.
- Imprime la unión de ambos conjuntos.

**Ayuda:**
- Utiliza llaves `{}` para definir conjuntos.
- Aplica el método `union()` para obtener la unión de dos conjuntos.

---

### Nivel Intermedio

#### Ejercicio 6: Iterar sobre Listas y Tuplas

**Objetivo:**
- Itera sobre tu lista de colores favoritos e imprime cada color.
- Haz lo mismo con la tupla de edades de tus amigos.

**Ayuda:**
- Utiliza un bucle `for` para recorrer los elementos de una lista y una tupla.
- Imprime cada elemento en el bucle.

---

#### Ejercicio 7: Operaciones con Listas

**Objetivo:**
- Ordena tu lista de colores favoritos alfabéticamente.
- Crea una nueva lista que sea una sublista de los primeros tres colores.

**Ayuda:**
- Utiliza el método `sort()` para ordenar una lista.
- Realiza operaciones de slicing para obtener sublistas.

---

#### Ejercicio 8: Diccionarios Anidados

**Objetivo:**
- Crea un diccionario que contenga información sobre dos películas, cada una con su propio conjunto de detalles.
- Accede e imprime un detalle de la segunda película.

**Ayuda:**
- Define un diccionario que contenga otros diccionarios como valores.
- Accede a los valores internos utilizando múltiples claves.

---

#### Ejercicio 9: Conjuntos y Operaciones

**Objetivo:**
- Crea un conjunto con tus asignaturas favoritas de este semestre.
- Crea otro conjunto con asignaturas que no te gustaron el semestre pasado.
- Imprime la intersección de ambos conjuntos.

**Ayuda:**
- Utiliza llaves `{}` para definir conjuntos.
- Aplica el método `intersection()` para obtener la intersección de dos conjuntos.

---

#### Ejercicio 10: Combinar Estructuras de Datos

**Objetivo:**
- Crea una lista que contenga diccionarios con información sobre tus amigos y sus colores favoritos.
- Accede e imprime el color favorito del segundo amigo.

**Ayuda:**
- Combina listas, diccionarios y otros tipos de datos según sea necesario.
- Accede a los elementos específicos utilizando índices y claves.

---

### Nivel Avanzado

#### Ejercicio 11: Listas de Comprensión

**Objetivo:**
- Crea una lista de números del 1 al 10 elevados al cuadrado utilizando listas de comprensión.

**Ayuda:**
- Utiliza la sintaxis de listas de comprensión para generar la lista.

---

#### Ejercicio 12: Operaciones Avanzadas con Diccionarios

**Objetivo:**
- Crea dos diccionarios con información sobre películas.
- Copia el contenido de un diccionario al otro.
- Fusiona los dos diccionarios en uno solo.

**Ayuda:**
- Utiliza los métodos `copy()` y `update()` para manipular diccionarios.

---

#### Ejercicio 13: Conjuntos y Conjuntos Inmutables

**Objetivo:**
- Crea un conjunto inmutable con tus géneros de películas favoritos.
- Realiza operaciones avanzadas como comprobar si otro conjunto es un subconjunto.

**Ayuda:**
- Utiliza `frozenset()` para crear conjuntos inmutables.
- Aplica métodos como `issubset()` para operaciones avanzadas.

---

#### Ejercicio 14: Filtrar Datos con Estructuras de Datos

**Objetivo:**
- Filtra las películas de tu lista que tienen una clasificación de más de 4 estrellas.
- Imprime el resultado.

**Ayuda:**
- Utiliza comprensión de listas o diccionarios para filtrar elementos.

---

#### Ejercicio 15: Combinar Estructuras de Datos Avanzadas

**Objetivo:**
- Crea una estructura de datos que contenga listas, diccionarios y conjuntos de manera combinada.
- Accede e imprime elementos de manera específica.

**Ayuda:**
- Combina diversas estructuras de datos según sea necesario.
- Accede a los elementos específicos utilizando índices, claves y métodos de conjuntos.

Estos ejercicios deberían ofrecerte un desafío más avanzado. ¡Inténtalos y no dudes en preguntar si necesitas ayuda!

