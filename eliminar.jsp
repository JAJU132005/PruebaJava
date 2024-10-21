<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Eliminar Usuario</h1>
            <p class="lead">¿Estás seguro de que deseas eliminar este usuario?</p>
        </div>
        
        <%
            String id = request.getParameter("id");
            String mensaje = "";

            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                    String consultaSQL = "DELETE FROM usuarios WHERE id = ?";
                    PreparedStatement ps = con.prepareStatement(consultaSQL);
                    ps.setInt(1, Integer.parseInt(id));
                    int i = ps.executeUpdate();
                    if (i > 0) {
                        mensaje = "Usuario eliminado con éxito.";
                    } else {
                        mensaje = "No se pudo eliminar el usuario.";
                    }
                    con.close();
                } catch (Exception e) {
                    mensaje = "Error: " + e.getMessage();
                }
            }
        %>

        <% if (mensaje.isEmpty()) { %>
            <form action="eliminar.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <button type="submit" class="btn btn-danger">Eliminar</button>
                <a href="mostrar.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        <% } else { %>
            <div class="alert alert-info mt-3"><%= mensaje %></div>
            <a href="mostrar.jsp" class="btn btn-secondary mt-3">Ver Usuarios</a>
        <% } %>
        
        <a href="index.jsp" class="btn btn-secondary mt-3">Volver a Inicio</a>
    </div>
</body>

</html>
