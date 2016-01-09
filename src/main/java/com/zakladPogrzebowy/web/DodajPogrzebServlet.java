package com.zakladPogrzebowy.web;

import com.zakladPogrzebowy.serwis.TrumnaManager;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/DodajPogrzeb")
public class DodajPogrzebServlet extends HttpServlet{
    @EJB
    private TrumnaManager tm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("trumnyDostepne", tm.dajDostepne());
        request.getRequestDispatcher("pogrzeby/dodaj.jsp").forward(request, response);
    }
}
