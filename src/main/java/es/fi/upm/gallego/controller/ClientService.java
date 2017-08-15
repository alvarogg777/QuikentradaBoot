package es.fi.upm.gallego.controller;

import java.util.ArrayList;
import java.util.List;

//import javax.persistence.NamedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.fi.upm.gallego.model.Cliente;
import es.fi.upm.gallego.model.EventReport;
import es.fi.upm.gallego.repository.ClientRepository;
import es.fi.upm.gallego.repository.EventRepository;

@Service("clientService")
public class ClientService{

	@Autowired
	private ClientRepository clientRepository;
	@Autowired
	private EventRepository eventRepository;

	@Transactional
	public Cliente save(Cliente cliente) {
		System.out.println("save");
		return clientRepository.save(cliente);
	}

	public List<Cliente> findAllClients() {
		List<Cliente> clients = new ArrayList<>();
		clientRepository.findAll().forEach(clients::add);
		return clients;
	}

	public List<EventReport> findAllClientReports() {
		// TODO Auto-generated method stub
		List<EventReport> eventosClientes=new ArrayList<EventReport>();
		eventRepository.findAll().forEach(evento-> {List<String> nifs=new ArrayList<String>(); evento.getPayments().forEach(payment->nifs.add(payment.getCliente().getNif())); eventosClientes.add(new EventReport(nifs,evento.getEvent_id(),evento.getNombre())); });

		return eventosClientes;
	}


}
