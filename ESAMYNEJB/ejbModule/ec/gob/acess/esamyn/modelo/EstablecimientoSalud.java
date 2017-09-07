package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_establecimiento_salud
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_establecimiento_salud")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "establecimiento de salud")
public class EstablecimientoSalud implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ess_id")
	private Long codigo;
	@Column(name = "ess_nombre")
	private String nombre;
	@Column(name = "ess_unicodigo")
	private String unicodigo;
	@Column(name = "ess_direccion")
	private String direccion;
	@Column(name = "ess_latitud")
	private String latitud;
	@Column(name = "ess_longitud")
	private String longitud;
	@Column(name = "ess_telefono")
	private String telefono;
	@Column(name = "ess_correo_electronico")
	private String correoElectronico;
	@Column(name = "ess_nombre_responsable")
	private String nombreResponsable;
	@Column(name = "ess_zona")
	private String zona;

	@Column(name = "ess_distrito")
	private String distrito;
	@JoinColumn(name = "ess_canton", referencedColumnName = "can_id")
	@ManyToOne
	private Canton canton;
	@JoinColumn(name = "ess_persona_juridica", referencedColumnName = "pju_id")
	@ManyToOne
	private PersonaJuridica personaJuridica;
	@Transient
	@XmlTransient
	private List<Evaluacion> evaluacionList;

	public EstablecimientoSalud() {
	}

	public EstablecimientoSalud(Long codigo) {
		super();
		this.codigo = codigo;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUnicodigo() {
		return unicodigo;
	}

	public void setUnicodigo(String unicodigo) {
		this.unicodigo = unicodigo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreoElectronico() {
		return correoElectronico;
	}

	public void setCorreoElectronico(String correoElectronico) {
		this.correoElectronico = correoElectronico;
	}

	public String getNombreResponsable() {
		return nombreResponsable;
	}

	public void setNombreResponsable(String nombreResponsable) {
		this.nombreResponsable = nombreResponsable;
	}

	public String getZona() {
		return zona;
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public Canton getCanton() {
		return canton;
	}

	public void setCanton(Canton canton) {
		this.canton = canton;
	}

	public PersonaJuridica getPersonaJuridica() {
		return personaJuridica;
	}

	public void setPersonaJuridica(PersonaJuridica personaJuridica) {
		this.personaJuridica = personaJuridica;
	}

	public List<Evaluacion> getEvaluacionList() {
		return evaluacionList;
	}

	public void setEvaluacionList(List<Evaluacion> evaluacionList) {
		this.evaluacionList = evaluacionList;
	}

}
