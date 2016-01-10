package com.zakladPogrzebowy.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.domena.Trumna;

import com.zakladPogrzebowy.serwis.PogrzebManager;
import com.zakladPogrzebowy.serwis.TrumnaManager;

@WebServlet(urlPatterns = "/EdytujPogrzeb/*")
public class EdytujPogrzebServlet extends HttpServlet{
    @EJB
    private PogrzebManager pm;
    @EJB
    private TrumnaManager tm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String link = request.getPathInfo();
        request.setAttribute("pogrzebEdytowany", pm.pobierzPoId(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
        request.setAttribute("trumnyDostepne", tm.dajDostepne());
        request.getRequestDispatcher("/pogrzeby/edytuj.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pogrzeb pogrzeb = new Pogrzeb();
	String link = request.getPathInfo();
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	pogrzeb =  pm.pobierzPoId(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length())));

	try
	{
        pm.edytuj(pogrzeb, format.parse(request.getParameter("data")), tm.pobierzPoId(Long.parseLong(request.getParameter("trumna"))),Double.parseDouble(request.getParameter("cena")),request.getParameter("opis"));
	}	
	catch(Exception e)
	{
	}

 	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Pogrzeby"));
    }
}
