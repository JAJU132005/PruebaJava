<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Lista de Usuarios</h1>
        </div>

        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo Electrónico</th>
                    <th>Género</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Dirección</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
                        while (rs.next()) {
                %>      
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("nombre") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("gender") %></td>
                                <td><%= rs.getString("dob") %></td>
                                <td><%= rs.getString("direccion") %></td>
                                <td>
                                    <a href="actualizar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Modificar</a>
                                    <a href="eliminar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    }
                %>
            </tbody>
        </table>

        <a href="insertar.jsp" class="btn btn-primary mt-3">Agregar Nuevo Usuario</a>
        <a href="index.jsp" class="btn btn-secondary mt-3">Volver a Inicio</a>
    </div>
</body>

</html>
