package com.zakladPogrzebowy.rest;

import java.util.List;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.serwis.PogrzebManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;


@Stateless
@Path("/pogrzeb")
public class PogrzebResource{
    @EJB
    private PogrzebManager pm;

    @GET
    @Path("/dajWszystkie")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Pogrzeb> dajPogrzeby() {
    	 return pm.dajWszystkie();
    }

    @DELETE
    @Path("/usun")
    public Response usunPogrzeb(@FormParam("id") long id)
    {
        Pogrzeb pogrzeb = new Pogrzeb();

        pogrzeb.setId(id);
        pm.usun(pogrzeb);
        return Response.status(Response.Status.OK).build();
    }

}
