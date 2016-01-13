package com.zakladPogrzebowy.rest;

import java.util.List;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.domena.Trumna;
import com.zakladPogrzebowy.serwis.PogrzebManager;
import com.zakladPogrzebowy.serwis.TrumnaManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
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
@Path("/pogrzeb")
public class PogrzebResource{
    @EJB
    private PogrzebManager pm;
    @EJB
    private TrumnaManager tm;

    @GET
    @Path("/dajWszystkie")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Pogrzeb> dajPogrzeby() {
    	 return pm.dajWszystkie();
    }

    @POST
    @Path("/dodaj")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public void dodaj(
            @FormParam("data") String data,
            @FormParam("trumna") Long trumna,
            @FormParam("cena") Double cena,
	    @FormParam("opis") String opis)
    {
	Pogrzeb pogrzeb = new Pogrzeb();

	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	try
	{
		pogrzeb.setData(format.parse(data));
	}
	catch(Exception e)
	{
	}
	pogrzeb.setTrumna(tm.pobierzPoId(trumna));
	pogrzeb.setCena(cena);
	pogrzeb.setOpis(opis);

	pm.dodaj(pogrzeb);

       //return Response.status(Response.Status.CREATED).build();
    }

    @POST
    @Path("/edytuj/{id}")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public void edytuj(
            @PathParam("id") Long id,
            @FormParam("data") String data,
            @FormParam("trumna") Long trumna,
            @FormParam("cena") Double cena,
	    @FormParam("opis") String opis)
    {
	Pogrzeb pogrzeb = new Pogrzeb();

	pogrzeb = pm.pobierzPoId(id);
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	try
	{
		pm.edytuj(pogrzeb, format.parse(data), tm.pobierzPoId(trumna), cena, opis);
	}
	catch(Exception e)
	{
	}

       //return Response.status(Response.Status.OK).build();
    }

    @DELETE
    @Path("/usun/{i}")
    public Response usun(@PathParam("id") long id)
    {
        Pogrzeb pogrzeb = new Pogrzeb();

        pogrzeb.setId(id);
        pm.usun(pogrzeb);
        return Response.status(Response.Status.OK).build();
    }

}
