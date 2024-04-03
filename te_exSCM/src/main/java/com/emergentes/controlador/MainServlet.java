package com.emergentes.controlador;

import com.emergentes.modelo.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        HttpSession sess = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) sess.getAttribute("listest");

        switch (op) {
            case "NUEVO":
                request.setAttribute("miobjest", new Estudiante());
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "EDITAR":
                int id = Integer.parseInt(request.getParameter("id"));
                int pos = buscarPorIndice(request, id);
                Estudiante objest = lista.get(pos);
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "ELIMINAR":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                int posEliminar = buscarPorIndice(request, idEliminar);
                if (posEliminar >= 0) {
                    lista.remove(posEliminar);
                }
                response.sendRedirect("index.jsp");
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = (Integer.parseInt(request.getParameter("Id")));
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listest");
        Estudiante objest = new Estudiante();
        objest.setId(id);
        objest.setNombre(request.getParameter("Nombre"));
        int pnot = (Integer.parseInt(request.getParameter("P1")));

        if (pnot <= 30) {
            objest.setP1(pnot);
        } else {
            objest.setP1(0);
        }
        int snot = (Integer.parseInt(request.getParameter("P2")));
        if (snot <= 30) {
            objest.setP2(snot);
        } else {
            objest.setP2(0);
        }
        int enot = (Integer.parseInt(request.getParameter("EF")));
        if (enot <= 40) {
            objest.setEF(enot);
        } else {
            objest.setEF(0);
        }

        if(pnot <=30 && snot <= 30 && enot <= 40){
            objest.setNota(pnot+snot+enot);
        }

        if (id == 0) {
            int idNew = obtenerId(request);
            objest.setId(idNew);
            lista.add(objest);
        } else {
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objest);
        }
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession sess = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) sess.getAttribute("listest");

        int pos = -1;

        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId() == id) {
                    pos = i;
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession sess = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) sess.getAttribute("listest");

        int idN = 0;
        if (lista != null && !lista.isEmpty()) {
            idN = lista.get(lista.size() - 1).getId();
        }
        return idN + 1;
    }
}
