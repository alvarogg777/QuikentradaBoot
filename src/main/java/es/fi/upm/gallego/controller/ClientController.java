package es.fi.upm.gallego.controller;

import java.util.List;
import java.util.ListIterator;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import es.fi.upm.gallego.auxiliar.Login;
import es.fi.upm.gallego.model.Cliente;
import es.fi.upm.gallego.model.EventReport;
import es.fi.upm.gallego.model.Evento;
import es.fi.upm.gallego.model.Payment;

//@Controller
@RestController
//@SessionAttributes({"cliente"})
public class ClientController {

	
	@Autowired
	private ClientService clientService;
	@Autowired
	private EventService eventService;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showHome(@RequestParam(value = "viewResolver") Optional<String> viewResolver) {
    	ModelAndView model = new ModelAndView();
    	model.setViewName("index");
    	return model;
    	}

	@RequestMapping(value = "addClient", method = RequestMethod.GET,params="event")
	public ModelAndView addClient(@RequestParam(value="event") String event, HttpSession session) {
		Evento ev=eventService.findEvent(event);
		Cliente cliente = (Cliente) session.getAttribute("nif");
		if (cliente==null){
			cliente=new Cliente();
		}
		session.removeAttribute("pdf");
		session.setAttribute("cliente", cliente);
		session.setAttribute("evento", ev);
		ModelAndView model = new ModelAndView();
		model.addObject("cliente", cliente);
    	model.setViewName("addClient");
    	return model;
	}
	
	@RequestMapping(value = "addClient", method = RequestMethod.POST)
	public ModelAndView updateClient(@Valid @ModelAttribute("cliente") Cliente cliente, BindingResult result,HttpSession session) {
		System.out.println("result has errors: " + result.hasErrors());
		System.out.println("Client set: " + cliente.getNombre());
		ModelAndView model = new ModelAndView();
    	model.setViewName("addPayment");
    	return model;
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public ModelAndView login(@RequestParam("user") String user){
		ModelAndView model = new ModelAndView();
		if(user.equals("admin"))
			model.setViewName("admin");
		else 
			model.setViewName("index");    	
		return model;
	}
	@RequestMapping(value="admin", method=RequestMethod.GET)
	public ModelAndView admin(ModelAndView model){
		List <Evento> eventos=eventService.findAllEvents();
//		ListIterator<Evento>list_eventos=eventos.listIterator();
	//	while(list_eventos.hasNext())
		//	System.out.println(list_eventos.next().getNombre());
		model.addObject("eventos", eventos);
		model.setViewName("admin");
//		return "admin";
		return model;
			
		
	}
	
	@RequestMapping(value="admin",method=RequestMethod.POST)
	public String admin(@RequestParam("evento") String id,Model model,HttpSession session){
		System.out.println("delete");
		Evento evento=eventService.findEvent(id);
		System.out.println("delete "+evento.getEvent_id());
		eventService.delete(evento);
		session.setAttribute("admin", "admin");
		return null;	
	}
	
	@RequestMapping(value="index",method=RequestMethod.POST)
	public @ResponseBody String admin(@RequestBody Login login,HttpSession session){
		if(login.getNif().equals("admin")&&login.getPass().equals("admin"))
			session.setAttribute("admin", "admin");
		return "admin";	
	}

	
	@RequestMapping(value="getClients", method=RequestMethod.GET)
	public ModelAndView getClients(ModelAndView model){
		
		List<Cliente> clientes = clientService.findAllClients();
		model.addObject("clients", clientes);
		int i=0,j=0;
		ListIterator<Cliente> listCli=clientes.listIterator();
		while(listCli.hasNext()){
			ListIterator<Payment> curr_cli_payments=listCli.next().getPayment().listIterator();
			while(curr_cli_payments.hasNext()){
				Evento ev=curr_cli_payments.next().getEvento();
				System.out.println("nif: "+clientes.get(i).getNif()+" id_evento: "+ev.getEvent_id());
				j++;
			}
			i++;
		}
		List<Evento> eventos=eventService.findAllEvents();
		model.addObject("eventos", eventos);
		model.setViewName("getClients");
		return model;
		
	}

	@RequestMapping(value="getClientReports",method=RequestMethod.GET)
	public ModelAndView getClientReports(ModelAndView model){
		List<EventReport> clientReports = clientService.findAllClientReports();
		System.out.println(clientReports.toString());
		model.addObject("clientReports",clientReports);
		model.setViewName("getClientReports");
		return model;
	}
	
}
