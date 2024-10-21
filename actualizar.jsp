<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Modificar Usuario</h1>
        </div>

        <%
            String mensaje = "";
            String id = request.getParameter("id");
            String nombre = "";
            String email = "";
            String gender = "";
            String dob = "";
            String direccion = "";

            if (request.getMethod().equalsIgnoreCase("POST")) {
                nombre = request.getParameter("nombre");
                email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmar_password = request.getParameter("confirmar_password");
                gender = request.getParameter("gender");
                dob = request.getParameter("dob");
                direccion = request.getParameter("direccion");

                if (!password.equals(confirmar_password)) {
                    mensaje = "Las contraseñas no coinciden.";
                } else {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                        String consultaSQL = "UPDATE usuarios SET nombre = ?, email = ?, password = ?, gender = ?, dob = ?, direccion = ? WHERE id = ?";
                        PreparedStatement ps = con.prepareStatement(consultaSQL);
                        ps.setString(1, nombre);
                        ps.setString(2, email);
                        ps.setString(3, password);
                        ps.setString(4, gender);
                        ps.setString(5, dob);
                        ps.setString(6, direccion);
                        ps.setInt(7, Integer.parseInt(id));
                        int i = ps.executeUpdate();
                        if (i > 0) {
                            mensaje = "Usuario modificado con éxito.";
                        } else {
                            mensaje = "No se pudo modificar el usuario.";
                        }
                        con.close();
                    } catch (Exception e) {
                        mensaje = "Error: " + e.getMessage();
                    }
                }
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                    String consultaSQL = "SELECT * FROM usuarios WHERE id = ?";
                    PreparedStatement ps = con.prepareStatement(consultaSQL);
                    ps.setInt(1, Integer.parseInt(id));
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        nombre = rs.getString("nombre");
                        email = rs.getString("email");
                        gender = rs.getString("gender");
                        dob = rs.getString("dob");
                        direccion = rs.getString("direccion");
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

        <form action="actualizar.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <div class="form-group">
                <label for="nombre">Nombre Completo:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
                
                <label for="email" class="mt-3">Correo Electrónico:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>

                <label for="password" class="mt-3">Nueva Contraseña:</label>
                <input type="password" class="form-control" id="password" name="password">

                <label for="confirmar_password" class="mt-3">Confirmar Nueva Contraseña:</label>
                <input type="password" class="form-control" id="confirmar_password" name="confirmar_password">

                <label class="mt-3">Género:</label><br>
                <input type="radio" id="male" name="gender" value="Male" <%= "Male".equals(gender) ? "checked" : "" %>> 
                <label for="male">Masculino</label>
                <input type="radio" id="female" name="gender" value="Female" <%= "Female".equals(gender) ? "checked" : "" %>> 
                <label for="female">Femenino</label>
                <input type="radio" id="other" name="gender" value="Other" <%= "Other".equals(gender) ? "checked" : "" %>> 
                <label for="other">Otro</label>

                <label for="dob" class="mt-3">Fecha de Nacimiento:</label>
                <input type="date" class="form-control" id="dob" name="dob" value="<%= dob %>" required>

                <label for="direccion" class="mt-3">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%= direccion %>" required>

                <button type="submit" class="btn btn-primary mt-4">Modificar</button>
            </div>
        </form>

        <% if (!mensaje.isEmpty()) { %>
            <div class="alert alert-info mt-3"><%= mensaje %></div>
        <% } %>

        <a href="mostrar.jsp" class="btn btn-secondary mt-3">Ver Usuarios</a>
        <a href="index.jsp" class="btn btn-secondary mt-3">Volver a Inicio</a>
    </div>
</body>

</html>
