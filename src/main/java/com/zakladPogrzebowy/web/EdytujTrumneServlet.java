package com.zakladPogrzebowy.web;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.zakladPogrzebowy.domena.Trumna;

import com.zakladPogrzebowy.serwis.TrumnaManager;

@WebServlet(urlPatterns = "/EdytujTrumne/*")
public class EdytujTrumneServlet extends HttpServlet{
    @EJB
    private TrumnaManager tm = new TrumnaManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String link = request.getPathInfo();
        request.setAttribute("trumnaEdytowana", tm.pobierzPoId(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
        request.getRequestDispatcher("/trumny/edytuj.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Trumna trumna = new Trumna();
	String link = request.getPathInfo();
	trumna =  tm.pobierzPoId(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length())));
        tm.edytuj(trumna, request.getParameter("rodzaj"), Double.parseDouble(request.getParameter("cena")), Integer.parseInt(request.getParameter("ilosc")));
 	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Trumny"));
    }
}
