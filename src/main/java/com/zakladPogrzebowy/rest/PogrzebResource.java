package com.zakladPogrzebowy.rest;

import java.util.List;
import java.util.Date;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.domena.Trumna;
import com.zakladPogrzebowy.serwis.PogrzebManager;
import com.zakladPogrzebowy.serwis.TrumnaManager;

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
import javax.ws.rs.PUT;


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

    @PUT
    @Path("/dodaj")
    @Produces("text/plain") 
    public Response dodaj(
            @FormParam("data") Date data,
            @FormParam("trumna") Trumna trumna,
            @FormParam("cena") Double cena,
	    @FormParam("opis") String opis) {

        Pogrzeb pogrzeb = new Pogrzeb();

        pogrzeb.setData(data);
        pogrzeb.setTrumna(trumna);
        pogrzeb.setCena(cena);
        pogrzeb.setOpis(opis);

        pm.dodaj(pogrzeb);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Path("/usun")
    public Response usun(@FormParam("id") long id)
    {
        Pogrzeb pogrzeb = new Pogrzeb();

        pogrzeb.setId(id);
        pm.usun(pogrzeb);
        return Response.status(Response.Status.OK).build();
    }

}
