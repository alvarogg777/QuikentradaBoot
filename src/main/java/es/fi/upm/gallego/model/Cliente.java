package es.fi.upm.gallego.model;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;


@Entity
@Table(name="cliente")
public class Cliente {

	public static final String FIND_ALL_CLIENTS="findAllClients";
	@Id
//	@GeneratedValue
	@Column(name="CLIENT_ID")
	@Pattern(regexp="\\d{8}\\w")
	//@Range(min=00000000,max=99999999)
	private String nif;
	
	//@Pattern(regexp="\\w{3,30}")
	//@Pattern(regexp="/^[a-z ,.'-]+$/i")
	@Column(name="nombre")
	private String nombre;
	
	@Pattern(regexp="\\w{3,30}")
	@Column(name="apellido")
	private String apellido;
	
	public Cliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cliente(String nif, String nombre, String apellido, String email, List<Payment> payment, String password) {
		super();
		this.nif = nif;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.payment = payment;
		this.password = password;
	}

	@Column(name="email")
//	@Pattern(regexp=".+@.+\\..+")
	private String email;

	@OneToMany
	@JoinTable(name="JOIN_CLIENT_PAYMENTS",joinColumns={@JoinColumn(name="nif")},inverseJoinColumns={@JoinColumn(name="payment_id")})
	private List<Payment> payment = new ArrayList<Payment>();


	@Override
	public String toString() {
		return "Cliente [nif=" + nif + ", nombre=" + nombre + ", apellido=" + apellido + ", email=" + email
				+ ", payment=" + payment + ", password=" + password + "]";
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="password")
	private String password;

	public String getApellido() {
		return this.apellido;
	}

	
	public String getNif() {
		return this.nif;
	}


	public String getNombre() {
		return this.nombre;
	}

	@Column(name="password")
	public String getEmail() {
		return this.email;
	}


	public List<Payment> getPayment() {
		return this.payment;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public void setNif(String nif) {
		this.nif = nif;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setPayment(List<Payment> payment) {
		this.payment = payment;
	}


}