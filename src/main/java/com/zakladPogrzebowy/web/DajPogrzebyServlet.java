package com.zakladPogrzebowy.web;

import com.zakladPogrzebowy.serwis.PogrzebManager;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Pogrzeby")
public class DajPogrzebyServlet extends HttpServlet{
    @EJB
    private PogrzebManager pm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("pogrzeby", pm.dajWszystkie());
        request.getRequestDispatcher("dane/pogrzeby.jsp").forward(request, response);
    }
}
