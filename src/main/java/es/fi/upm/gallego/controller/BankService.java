package es.fi.upm.gallego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import es.fi.upm.gallego.model.Payment;
import es.fi.upm.gallego.repository.BankRepository;
//@Service("bankService")
@Component
public class BankService {

	@Autowired
	private BankRepository bankRepository;
	@Transactional
	public Payment save(Payment payment) {
		
		bankRepository.save(payment);
				
		return payment;
	}
	public void delete(Payment payment) {
		// TODO Auto-generated method stub
		bankRepository.delete(payment);
	}
}
