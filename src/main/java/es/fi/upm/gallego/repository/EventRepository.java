package es.fi.upm.gallego.repository;

import org.springframework.data.repository.CrudRepository;
import es.fi.upm.gallego.model.Evento;

public interface EventRepository extends CrudRepository<Evento, String>{}