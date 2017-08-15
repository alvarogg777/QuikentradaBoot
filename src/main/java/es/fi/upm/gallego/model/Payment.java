package es.fi.upm.gallego.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="BANK_DETAILS")
public class Payment {
	@Id
	@GeneratedValue
	@Column(name="PAYMENT_ID")
	private Long id;
	
//	@ManyToMany
	@ManyToOne
	@JoinTable(name="JOIN_CLIENT_PAYMENTS",joinColumns={@JoinColumn(name="payment_id")},inverseJoinColumns={@JoinColumn(name="nif")})
//	private List<Cliente> clientes=new ArrayList<Cliente>();
	private Cliente cliente;
	
	@ManyToOne
	@JoinTable(name="JOIN_EVENTS_PAYMENT",joinColumns={@JoinColumn(name="payment_id")},inverseJoinColumns={@JoinColumn(name="event_id")})
	private Evento evento;
//	@Range(min=1111111111)
//@Pattern(regexp="\\d{4}-\\d{4}-\\d{4}-\\d{4}")
// en realidad son 16 digitos IBAN
	@Column(name="BANK_CARD_NUM")
	private String bank_card_num;

	//@Pattern(regexp="\\d{2}/\\d{2}")
	@Column(name="FECHA_CAD")
	private String fecha;

	//@Range(min=100,max=999)
	@Column(name="CVV")
	private int cvv;
	public Payment() {super();}
	public Payment(Long id, Cliente cliente,Evento evento, String bank_card_num, String fecha,int cvv) {
		this.bank_card_num=bank_card_num;
//		this.clientes=clientes;
		this.cliente=cliente;
		this.evento=evento;
		this.fecha=fecha;
		this.id=id;
		// TODO Auto-generated constructor stub
	}
	
	public String getBank_card_num() {
		return bank_card_num;
	}
	
	public Cliente getCliente() {
		return cliente;
	}
	
	public int getCvv() {
		return cvv;
	}

	public Evento getEvento() {
			return evento;
		}

	public String getFecha() {
		return fecha;
	}

	public Long getId() {
		return id;
	}

	public void setBank_card_num(String bank_card_num) {
		this.bank_card_num = bank_card_num;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public List<String> getNifs(){
		List<Payment> payments=this.evento.getPayments();
//		System.out.println(payments.size());
		List<String> nifs=new ArrayList<String>();
		if(!payments.isEmpty()) {
			for(Payment payment: payments) 
				nifs.add(payment.getCliente().getNif());
		}
		return nifs;
	}
	@Override
	public String toString() {
		return "Payment [id=" + id + ", cliente=" + cliente + ", evento=" + evento + ", bank_card_num=" + bank_card_num
				+ ", fecha=" + fecha + ", cvv=" + cvv + "]";
	}

}