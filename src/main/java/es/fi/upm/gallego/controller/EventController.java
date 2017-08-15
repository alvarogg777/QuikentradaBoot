package es.fi.upm.gallego.controller;

import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import es.fi.upm.gallego.model.Cliente;
import es.fi.upm.gallego.model.Evento;


//@Controller
@RestController
@SessionAttributes("evento")
public class EventController {

	@Autowired
	private EventService eventService;
	
	@RequestMapping(value = "addEvent",  method = RequestMethod.GET)
	public ModelAndView disponibilidad(ModelAndView model, HttpSession session) {
		Evento evento= (Evento) session.getAttribute("event_id");
		
		if (evento==null){
			evento=new Evento();
//			client.setMinutes(10);
		}
		//goal.setMinutes(10);
		model.addObject("evento", evento);
		model.setViewName("addEvent");
		return model;
	}
	
	@RequestMapping(value = "addEvent",  method = RequestMethod.POST)
	public ModelAndView addEvent(@Valid @ModelAttribute ("evento") Evento evento, HttpSession session, BindingResult result) {
//		System.out.println("client_id: "+exercise.getClient().getDni());
		System.out.println("EventID: " + evento.getEvent_id());
		System.out.println("Event_name: " + evento.getNombre());
		ModelAndView model = new ModelAndView();

		if(result.hasErrors()||evento.getDisponibilidad()==0) {
			if(evento.getDisponibilidad()==0)
				result.addError(new ObjectError("error","Number of tickets must be greater than zero"));
	    	model.setViewName("addEvent");
			return model;
		}
		else{
			System.out.println("CREATE EVENT OK");
			//Cliente cliente = (Cliente)session.getAttribute("cliente");
			//List<Cliente> list_cliente=evento.getClientes();
			//list_cliente.add(cliente);
			//evento.setClientes(list_cliente);
			eventService.save(evento);
			session.setAttribute("admin", "admin");
			model.setViewName("admin");
			return model;
		}
		
	}
	
	@RequestMapping(value="getClientes", method=RequestMethod.GET)
	public ModelAndView getGoals(ModelAndView model){
		
		List<Cliente> clients = eventService.findAllClients();
		model.setViewName("getClientes");
		//model.addAttribute("clientes", clients);
		return model;
		
	}
	
	@RequestMapping(value="getEvent", method=RequestMethod.GET)
	public ModelAndView getEvent(ModelAndView model,HttpSession session ,@RequestParam(value="event") String event_id){
		
		Evento event = eventService.findEvent(event_id);

		model.addObject("evento", event);
		session.setAttribute("evento", event);
		//model.addAttribute("clientes", clients);
		model.setViewName("getClientes");
		return model;
		
	}
	
	@RequestMapping(value = "getEvents", method = RequestMethod.GET)
	public ModelAndView findAllEvents(ModelAndView model,HttpSession session) {
		List <Evento> eventos=eventService.findAllEvents();
		ListIterator<Evento>list_eventos=eventos.listIterator();
		while(list_eventos.hasNext())
			System.out.println(list_eventos.next().getNombre());
		model.addObject("eventos", eventos);
		session.setAttribute("eventos", eventos);
		model.setViewName("getEvents");
		return model;
	}
	
}
