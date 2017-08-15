package es.fi.upm.gallego.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import es.fi.upm.gallego.auxiliar.*;
import es.fi.upm.gallego.model.Cliente;
import es.fi.upm.gallego.model.Evento;
import es.fi.upm.gallego.model.Payment;
//@Controller
@RestController
@SessionAttributes("payment")
public class PaymentController {
	 
	@Autowired private BankService bankService;
	@Autowired private ClientService clientService;
	@Autowired private EventService eventService;
	
	@RequestMapping(value="addPayment",method = RequestMethod.GET)
	public ModelAndView getForm(ModelAndView model,HttpSession session){
	Payment	payment=new Payment();
	model.addObject("payment", payment);
	model.setViewName("addPayment");
		return model;
	}

	@Transactional
	@RequestMapping(value="addPayment",method = RequestMethod.POST)
	public ModelAndView addPayment(@Valid @ModelAttribute ("payment") Payment payment, HttpSession session, BindingResult result) throws Exception {
//		System.out.println("client_id: "+exercise.getClient().getDni());
		ModelAndView model = new ModelAndView();

	    System.out.println("payment_id: " +payment.getId()+" card_num:"+ payment.getBank_card_num());
		Cliente cliente=null;
		
		if(result.hasErrors()) {
			model.setViewName("addPayment");
			return model;
		}
		else{
			byte[] bank_card=CryptoAES.encrypt(payment.getBank_card_num()+"\0\0\0\0\0\0\0\0\0\0\0\0\0", CryptoAES.encryptionKey);
			byte[] cvv=CryptoAES.encrypt(String.valueOf(payment.getCvv())+"\0\0\0\0\0\0\0\0\0\0\0\0\0", CryptoAES.encryptionKey);
			byte[] fecha=CryptoAES.encrypt(payment.getFecha()+"\0\0\0\0\0\0\0\0\0\0\0", CryptoAES.encryptionKey);
			payment.setBank_card_num(String.valueOf(bank_card));
			payment.setCvv(Converter.byteArrayToInt(cvv));
			payment.setFecha(String.valueOf(fecha));
			cliente = (Cliente)session.getAttribute("cliente");
			System.out.println(cliente.getApellido());
			Evento e=(Evento)session.getAttribute("evento");
			payment.setCliente(cliente);
			e.setDisponibilidad(e.getDisponibilidad()-1);
			payment.setEvento(e);
			clientService.save(cliente);
			eventService.save(e);
			bankService.save(payment);
			session.setAttribute("pdf", "getPDF.html");
			
		}
		//return "redirect:addPayment.html";
		model.setViewName("addPayment");
		return model;
	}
	@RequestMapping(value = "getPDF",  method = RequestMethod.GET)
	public String getPDF() {
		
		return "getPDF";
	}
	@ModelAttribute("payment")
	 public Payment getPayment(HttpSession session,HttpServletRequest request) {
		request.setAttribute("payment", new Payment());
		session.setAttribute("payment", request.getAttribute("payment"));
		session.removeAttribute("pdf");
		return (Payment) request.getAttribute("payment");
	 }
	
}