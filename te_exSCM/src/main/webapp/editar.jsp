<%@page import="com.emergentes.modelo.Estudiante"%>
<%
    Estudiante reg = (Estudiante) request.getAttribute("miobjest");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .contenedor {
                width: 500px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                text-align: center;
            }
            .titulo {
                text-align: center;
            }
        </style>
    </head>

    <body>
        <div class="contenedor">
            <p>PRIMER PARCIAL TEM-742<br>
            Nombre: Silvana Callejas Meneses<br>
            Carnet: 9184752 L.P.</p>
        </div>
        <h1 class="titulo">Registro de calificaciones</h1>
        <div class="contenedor">
            <form action="MainServlet" method="post">
                <table>
                    <tr>
                        <td>ID</td>
                        <td><input type="text" name="Id" value="<%= reg.getId()%>" size="2" readonly></td>
                    </tr>
                    <tr>
                        <td>Nombre :</td>
                        <td><input type="text" name="Nombre" value="<%= reg.getNombre()%>"></td>
                    </tr>
                    <tr>
                        <td>Primer parcial (sobre 30 pts) :</td>
                        <td><input type="text" name="P1" value="<%= reg.getP1()%>"></td>
                    </tr>
                    <tr>
                        <td>Segundo parcial (sobre 30 puntos) :</td>
                        <td><input type="text" name="P2" value="<%= reg.getP2()%>"></td>
                    </tr>
                    <tr>
                        <td>Examen final parcial (sobre 40 puntos) :</td>
                        <td><input type="text" name="EF" value="<%= reg.getNota()%>"></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" value="ENVIAR"></td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
