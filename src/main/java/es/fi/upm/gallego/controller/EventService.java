package es.fi.upm.gallego.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.fi.upm.gallego.model.Cliente;
import es.fi.upm.gallego.model.Evento;
import es.fi.upm.gallego.repository.EventRepository;

@Service("eventService")
public class EventService{
	
	@Autowired
	private EventRepository eventRepository;

	public List<Evento> findAllEvents() {
		List<Evento> events= new ArrayList<Evento>();
		eventRepository.findAll().forEach(events::add);
		return events;
	}

	@Transactional
	public Evento save(Evento evento) {
		
		eventRepository.save(evento);
				
		return evento;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> findAllClients() {
		List<Cliente> listCliente= new ArrayList<Cliente>();
		eventRepository.findAll().forEach((Consumer<? super Evento>) cliente-> listCliente.addAll((Collection<? extends Cliente>) cliente));
		return listCliente;
	}

	public Evento findEvent(String event_id) {
		// TODO Auto-generated method stub
//		Evento e=eventRepository.loadEvento(event_id);
		return eventRepository.findOne(event_id);
//		return e;
	}

	public void delete(Evento evento) {
		// TODO Auto-generated method stub
		eventRepository.delete(evento);
	}
	
}