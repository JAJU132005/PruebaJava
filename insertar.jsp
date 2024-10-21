<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Insertar Nuevo Usuario</h1>
        </div>
        <form action="insertar.jsp" method="post">
            <div class="form-group">
                <label for="nombre">Nombre Completo:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
                
                <label for="email" class="mt-3">Correo Electrónico:</label>
                <input type="email" class="form-control" id="email" name="email" required>

                <label for="password" class="mt-3">Contraseña:</label>
                <input type="password" class="form-control" id="password" name="password" required>

                <label for="confirmar_password" class="mt-3">Confirmar Contraseña:</label>
                <input type="password" class="form-control" id="confirmar_password" name="confirmar_password" required>

                <label class="mt-3">Género:</label><br>
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Masculino</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Femenino</label>
                <input type="radio" id="other" name="gender" value="Other">
                <label for="other">Otro</label>

                <label for="dob" class="mt-3">Fecha de Nacimiento:</label>
                <input type="date" class="form-control" id="dob" name="dob" required>

                <label for="direccion" class="mt-3">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" required>

                <button type="submit" class="btn btn-primary mt-4">Insertar</button>
            </div>
        </form>

        <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmar_password = request.getParameter("confirmar_password");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String direccion = request.getParameter("direccion");

            if (!password.equals(confirmar_password)) {
                out.println("<div class='alert alert-danger mt-3'>Las contraseñas no coinciden.</div>");
            } else {
                Connection conexion = null;
                Statement sentencia = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                    sentencia = conexion.createStatement();

                    String consultaSQL = "INSERT INTO usuarios (nombre, email, password, gender, dob, direccion) VALUES ('" + nombre + "', '" + email + "', '" + password + "', '" + gender + "', '" + dob + "', '" + direccion + "')";
                    int filas = sentencia.executeUpdate(consultaSQL);

                    if (filas > 0) {
                        out.println("<div class='alert alert-success mt-3'>Usuario insertado correctamente.</div>");
                    } else {
                        out.println("<div class='alert alert-warning mt-3'>No se pudo insertar el usuario.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
                } finally {
                    if (sentencia != null) {
                        try { sentencia.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (conexion != null) {
                        try { conexion.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        }
        %>

        <a href="mostrar.jsp" class="btn btn-secondary mt-3">Ver Usuarios</a>
        <a href="index.jsp" class="btn btn-secondary mt-3">Volver a Inicio</a>
    </div>
</body>

</html>
