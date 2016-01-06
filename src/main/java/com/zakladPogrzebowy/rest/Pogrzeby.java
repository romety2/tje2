package com.zakladPogrzebowy.rest;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.serwis.PogrzebManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;


@Stateless
@Path("/home")
public class Pogrzeby{
    @EJB
    private PogrzebManager pm;

    @DELETE
    @Path("/usunPogrzeb")
    public void deleteHiring(@FormParam("id") long id)
    {
        Pogrzeb pogrzeb = new Pogrzeb();

        pogrzeb.setId(id);
        pm.usun(pogrzeb);
    }

}
