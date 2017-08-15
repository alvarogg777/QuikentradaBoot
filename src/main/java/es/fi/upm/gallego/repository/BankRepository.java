package es.fi.upm.gallego.repository;

import org.springframework.data.repository.*;
import es.fi.upm.gallego.model.Payment;

public interface BankRepository extends CrudRepository<Payment,String>{}