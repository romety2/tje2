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

import com.zakladPogrzebowy.serwis.PogrzebManager;

@WebServlet(urlPatterns = "/PodgladPogrzeb/*")
public class PodgladPogrzebServlet extends HttpServlet{
    @EJB
    private PogrzebManager pm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String link = request.getPathInfo();
        request.setAttribute("pogrzebEdytowany", pm.pobierzPoId(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
        request.getRequestDispatcher("/pogrzeby/podglad.jsp").forward(request, response);
    }
}
