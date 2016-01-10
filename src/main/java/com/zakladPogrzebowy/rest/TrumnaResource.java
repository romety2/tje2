package com.zakladPogrzebowy.rest;

import java.util.List;

import com.zakladPogrzebowy.domena.Trumna;
import com.zakladPogrzebowy.serwis.TrumnaManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.PUT;


@Stateless
@Path("/trumna")
public class TrumnaResource{
    @EJB
    private TrumnaManager tm;

    @GET
    @Path("/dajWszystkie")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Trumna> dajTrumny() {
    	 return tm.dajWszystkie();
    }

    @PUT
    @Path("/dodaj")
    public Response dodaj(
            @FormParam("rodzaj") String rodzaj,
            @FormParam("cena") Double cena,
            @FormParam("ilosc") Integer ilosc){

        Trumna trumna = new Trumna();

        trumna.setRodzaj(rodzaj);
        trumna.setCena(cena);
        trumna.setIlosc(ilosc);

        tm.dodaj(trumna);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Path("/usun")
    public Response usun(@FormParam("id") long id)
    {
        Trumna trumna = new Trumna();

        trumna.setId(id);
        tm.usun(trumna);
        return Response.status(Response.Status.OK).build();
    }

}
