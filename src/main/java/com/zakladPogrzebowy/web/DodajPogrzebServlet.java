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

@WebServlet(urlPatterns = "/DodajPogrzeb")
public class DodajPogrzebServlet extends HttpServlet{
    @EJB
    private PogrzebManager pm;
    @EJB
    private TrumnaManager tm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("trumnyDostepne", tm.dajDostepne());
        request.getRequestDispatcher("/pogrzeby/dodaj.jsp").forward(request, response);
    }

}
