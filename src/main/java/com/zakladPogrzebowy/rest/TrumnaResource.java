package com.zakladPogrzebowy.rest;

import java.util.List;

import com.zakladPogrzebowy.domena.Trumna;
import com.zakladPogrzebowy.serwis.TrumnaManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.POST;
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

    @POST
    @Path("/dodaj")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public void dodaj(
            @FormParam("rodzaj") String rodzaj,
            @FormParam("cena") Double cena,
            @FormParam("ilosc") Integer ilosc)
    {

        Trumna trumna = new Trumna();

        trumna.setRodzaj(rodzaj);
        trumna.setCena(cena);
        trumna.setIlosc(ilosc);

        tm.dodaj(trumna);

        //return Response.status(Response.Status.CREATED).build();
    }

    @POST
    @Path("/edytuj/{id}")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public void edytuj(
            @PathParam("id") Long id,
            @FormParam("rodzaj") String rodzaj,
            @FormParam("cena") Double cena,
            @FormParam("ilosc") Integer ilosc)
    {
 	Trumna trumna = new Trumna();

	trumna = tm.pobierzPoId(id);
	tm.edytuj(trumna, rodzaj, cena, ilosc);

       //return Response.status(Response.Status.OK).build();
    }

    @GET
    @Path("/usun/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public void usun(@PathParam("id") long id)
    {
        Trumna trumna = new Trumna();

        tm.usun(tm.pobierzPoId(id));
        //return Response.status(Response.Status.OK).build();
    }

}
