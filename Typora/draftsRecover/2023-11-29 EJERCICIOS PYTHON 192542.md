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

¡Entendido! Aquí te dejo 5 ejercicios para cada nivel (básico, intermedio y avanzado) de la Lección 2:

## Nivel Básico

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

Estos son los primeros cinco ejercicios para el Nivel Básico. Sigue con el siguiente conjunto cuando estés listo.

## Nivel Intermedio

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

Estos son los primeros cinco ejercicios para el Nivel Intermedio. Continúa con el siguiente conjunto cuando estés listo.

### Nivel Avanzado

11) Escribe un programa que genere una lista de números aleatorios y muestre solo los números pares.

12) Desarrolla un programa que simule un juego de ahorcado. Elige una palabra al azar y permite al usuario intentar adivinarla.

13) Pide al usuario que ingrese una cadena y muestra las palabras que comienzan con la letra 'a'.

14) Implementa un programa que calcule el factorial de un número ingresado por el usuario.

15) Crea un programa que solicite al usuario ingresar una serie de números y muestre el promedio de esos números.

