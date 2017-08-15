package es.fi.upm.gallego.model;


import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

@Entity
@NamedQueries({
@NamedQuery(name=Evento.FIND_ALL_EVENTS, query="Select e from Evento e"),
//@NamedQuery(name=Evento.FIND_EVENT_REPORTS, query="Select new es.fi.upm.gallego.model.EventReport(c.nif, e.event_id, e.nombre) FROM Cliente c,Evento e inner join e.payments ec inner join c.payment ed order by e.event_id,c.nif"),
@NamedQuery(name=Cliente.FIND_ALL_CLIENTS,query="Select g from Cliente g"),
})
public class Evento {

	public Evento(String nombre, Double precio, Integer disponibilidad, String tipo, String localidad,
			String fecha, List<Cliente> clientes) {
		super();
//		this.event_id = event_id;
		this.nombre = nombre;
		this.precio = precio;
		this.disponibilidad = disponibilidad;
		this.tipo = tipo;
		this.localidad = localidad;
		this.fecha = fecha;
		}

	public Evento() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public static final String FIND_EVENT_REPORTS="findAllClientsForEvent";
	public static final String FIND_ALL_EVENTS="findAllEvents";
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	//@Column(name="EVENT_ID")
	private Long event_id;
	
	private String nombre;
	
	private Double precio;
	
	//@Column(name="NUM_TICKETS")
	@Range(min = 0, max = 999999)
//	private Integer tickets_num;
	private Integer disponibilidad;

	private String tipo;
	
	private URL img;
	
	private String localidad;
	
	@Pattern(regexp="\\d{2}/\\d{2}/\\d{4}")
	//@Column(name="FECHA_CAD")
	private String fecha;
			
	@OneToMany(fetch=FetchType.EAGER,cascade={CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(name="JOIN_EVENTS_PAYMENT",joinColumns={@JoinColumn(name="event_id")},inverseJoinColumns={@JoinColumn(name="payment_id")})
	private List<Payment> payments = new ArrayList<Payment>();
	
//	@ManyToOne
	//private Client client;

//	public String getActivity() {


	public Long getEvent_id() {
		return event_id;
	}

	public URL getImg() {
		return img;
	}

	public void setImg(URL img) {
		this.img = img;
	}

	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public Double getPrecio() {
		return precio;
	}


	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public void setEvent_id(Long event_id) {
		this.event_id = event_id;
	}

	public Integer getDisponibilidad() {
		return disponibilidad;
	}

	public void setDisponibilidad(Integer disponibilidad) {
		this.disponibilidad = disponibilidad;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}
	
}