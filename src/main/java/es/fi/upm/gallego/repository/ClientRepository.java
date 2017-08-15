package es.fi.upm.gallego.repository;

import org.springframework.data.repository.CrudRepository;
import es.fi.upm.gallego.model.Cliente;

public interface ClientRepository extends CrudRepository<Cliente,String> {}
