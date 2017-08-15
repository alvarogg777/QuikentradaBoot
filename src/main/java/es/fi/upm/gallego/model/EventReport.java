package es.fi.upm.gallego.model;

import java.util.List;

public class EventReport {

	private List<String> nifs;
	private Long event_id;
	private String nombre;
	
	public EventReport(List<String> nifs, Long event_id, String nombre){
		
		this.nifs=nifs;
		this.event_id=event_id;
		this.nombre=nombre;
	};


	public List<String> getNifs() {
		return this.nifs;
	}

	public void setNifs(List<String> nif) {
		this.nifs = nif;
	}

	public Long getEvent_id() {
		return this.event_id;
	}

	@Override
	public String toString() {
		return "EventReport [nifs=" + this.nifs + ", event_id=" + this.event_id + ", nombre=" + this.nombre + "]";
	}


	public void setEvent_id(Long event_id) {
		this.event_id = event_id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}