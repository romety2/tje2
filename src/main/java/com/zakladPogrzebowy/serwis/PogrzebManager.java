package com.zakladPogrzebowy.serwis;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.zakladPogrzebowy.domena.Pogrzeb;
import com.zakladPogrzebowy.domena.Trumna;

@Stateless
public class PogrzebManager {

	@PersistenceContext
	EntityManager em;

	public Pogrzeb pobierzPoId(Long id) {
		return em.find(Pogrzeb.class, id);
	}

	public void dodaj(Pogrzeb pogrzeb) {
		pogrzeb.setId(null);
		em.persist(pogrzeb);
		Trumna trumna = em.find(Trumna.class, pogrzeb.getTrumna().getId());
		trumna.getPogrzeby().add(pogrzeb);
		trumna.setIlosc(trumna.getIlosc()-1);
		em.merge(trumna);
	}

	public void edytuj(Pogrzeb pogrzeb, Date data, Trumna trumna, Double cena, String opis) {
		pogrzeb = em.find(Pogrzeb.class, pogrzeb.getId());
		Trumna tr = em.find(Trumna.class, pogrzeb.getTrumna().getId());
		int i = 0;
		for(Pogrzeb p : tr.getPogrzeby()) {
			if (p == pogrzeb)
				break;
			i++;
		}
		pogrzeb.setTrumna(trumna);
		pogrzeb.setData(data);
		pogrzeb.setCena(cena);
		pogrzeb.setOpis(opis);
		tr.getPogrzeby().set(i, pogrzeb);
		em.merge(pogrzeb);
		tr.setIlosc(tr.getIlosc()+1);
		em.merge(tr);
		trumna.setIlosc(trumna.getIlosc()-1);
		em.merge(trumna);
	}

	public void usun(Pogrzeb pogrzeb) {
		pogrzeb = em.find(Pogrzeb.class, pogrzeb.getId());
		Trumna tr = em.find(Trumna.class, pogrzeb.getTrumna().getId());
		tr.getPogrzeby().remove(pogrzeb);
		em.remove(pogrzeb);
		tr.setIlosc(tr.getIlosc()+1);
		em.merge(tr);
	}

	public List<Pogrzeb> dajWszystkie() {
		return em.createNamedQuery("pogrzeb.wszystkie").getResultList();
	}

}

