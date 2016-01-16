package com.zakladPogrzebowy.web;

import com.zakladPogrzebowy.serwis.TrumnaManager;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Trumny")
public class DajTrumnyServlet extends HttpServlet{
    @EJB
    private TrumnaManager tm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("trumny", tm.dajWszystkie());
        request.getRequestDispatcher("dane/trumny.jsp").forward(request, response);
    }
}
