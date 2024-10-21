<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz de Java</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <!-- Cabecera -->
        <header class="row bg-primary text-white text-center py-4">
            <div class="col-12">
                <h1>Bienvenido a Mi Aplicacion</h1>
            </div>
        </header>

        <!-- Cuerpo con Cards -->
        <div class="row my-4">
            <div class="col-12 col-md-6 col-lg-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Hoja de Vida</h5>
                        <p class="card-text">Conoce mas sobre mi y mi existenciax.</p>
                        <a href="hojaVida.jsp" class="btn btn-primary">Ver Mas</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Formulario CRUD</h5>
                        <p class="card-text">Gestiona datos con nuestra interfaz.</p>
                        <a href="insertar.jsp" class="btn btn-primary">Ingresar</button></a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pasatiempos</h5>
                        <p class="card-text">Descubre mis pasatiempos favoritos.</p>
                        <a href="pasatiempos.jsp" class="btn btn-primary">Ver Mas</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Ubicacion</h5>
                        <p class="card-text">Encuentra mi ubicación en cualquier parte.</p>
                        <a href="ubicacion.jsp" class="btn btn-primary">Ver Mas</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pie de Página -->
        <footer class="row bg-secondary text-white text-center py-4">
            <div class="col-12">
                <h3>Desarrollado por Juan Zarate</h3>
            </div>
        </footer>
    </div>
</body>

</html>
