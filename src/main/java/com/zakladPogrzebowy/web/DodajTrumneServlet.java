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

@WebServlet(urlPatterns = "/DodajTrumne")
public class DodajTrumneServlet extends HttpServlet{
    @EJB
    private TrumnaManager tm = new TrumnaManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/trumny/dodaj.jsp").forward(request, response);
    }
}
