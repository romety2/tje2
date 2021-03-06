package com.zakladPogrzebowy.serwis;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.zakladPogrzebowy.domena.Trumna;

@Stateless
public class TrumnaManager {

	@PersistenceContext
	EntityManager em;

	public Trumna pobierzPoId(Long id) {
		return em.find(Trumna.class, id);
	}

	public void dodaj(Trumna trumna) {
		trumna.setId(null);
		em.persist(trumna);
        	em.flush();
	}

	public void edytuj(Trumna trumna, String rodzaj, Double cena, Integer ilosc) {
		trumna = em.find(Trumna.class, trumna.getId());
		trumna.setRodzaj(rodzaj);
		trumna.setCena(cena);
		trumna.setIlosc(ilosc);
		em.merge(trumna);
	}

	public void usun(Trumna trumna) {
		trumna = em.find(Trumna.class, trumna.getId());
		em.remove(trumna);
	}

	public List<Trumna> dajWszystkie() {
		return em.createNamedQuery("trumna.wszystkie").getResultList();
	}

	public List<Trumna> dajDostepne() {
		return em.createNamedQuery("trumna.dostepne").getResultList();
	}
}

