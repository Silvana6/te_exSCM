<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Estudiante"%>
<%
    if(session.getAttribute("listest") == null){
        ArrayList<Estudiante> listaux = new ArrayList<Estudiante>();
        session.setAttribute("listest", listaux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listest");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .contenedor {
                width: 300px; 
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
        <h1 class="titulo">Registro de Calificaciones</h1>
        <button><a href="MainServlet?op=NUEVO">NUEVO</a></button>
        <table border ="1">
            <tr>
                <th>ID</th>
                <th>NOMBRE COMPLETO</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>P3(40)</th>
                <th>NOTA</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if(lista != null){
                    for(Estudiante item : lista){

            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNombre() %></td>
                <td><%= item.getP1() %></td>
                <td><%= item.getP2() %></td>
                <td><%= item.getEF() %></td>
                <td><%= item.getNota() %></td>
                
                <td>
                    <a href="MainServlet?op=EDITAR&id=<%= item.getId() %>">EDITAR</a>
                </td>
                <td>
                    <a href="MainServlet?op=ELIMINAR&id=<%= item.getId() %>"
                       onclick="return(confirm('¿Está segur@ de eliminar este registro?'))">ELIMINAR</a>
                </td>
            </tr>
            
            <%                    
                    }
            }
            %>
        </table>
    </body>
</html>
