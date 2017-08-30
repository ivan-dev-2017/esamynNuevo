package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
 * Entidad que refleja la estructura de tabla esa_pregunta
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_pregunta")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pregunta")
public class Pregunta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "prg_id")
	private Long codigo;

	@Column(name = "prg_texto")
	@XmlTransient
	private String texto;
	@Column(name = "prg_codigo_verificacion")
	private String codigoVerificacion;
	@Column(name = "prg_ayuda")
	private String ayuda;
	@Column(name = "prg_prefijo")
	private String prefijo;
	@Column(name = "prg_subfijo")
	private String subfijo;
	@Column(name = "prg_validacion")
	private String validacion;
	@Column(name = "prg_orden")
	private Integer orden;
	@JoinColumn(name = "prg_formulario", referencedColumnName = "frm_id")
	@ManyToOne
	private Formulario formulario;
	@Transient
	private List<Pregunta> preguntaLista;
	@JoinColumn(name = "prg_padre", referencedColumnName = "prg_id")
	@ManyToOne(fetch = FetchType.LAZY)
	private Pregunta padre;
	@JoinColumn(name = "prg_tipo_pregunta", referencedColumnName = "tpp_id")
	@ManyToOne
	private TipoPregunta tipoPregunta;
	@Transient
	private Respuesta respuesta;

	public Pregunta() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public String getCodigoVerificacion() {
		return codigoVerificacion;
	}

	public void setCodigoVerificacion(String codigoVerificacion) {
		this.codigoVerificacion = codigoVerificacion;
	}

	public String getAyuda() {
		return ayuda;
	}

	public void setAyuda(String ayuda) {
		this.ayuda = ayuda;
	}

	public String getPrefijo() {
		return prefijo;
	}

	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}

	public String getSubfijo() {
		return subfijo;
	}

	public void setSubfijo(String subfijo) {
		this.subfijo = subfijo;
	}

	public String getValidacion() {
		return validacion;
	}

	public void setValidacion(String validacion) {
		this.validacion = validacion;
	}

	public Integer getOrden() {
		return orden;
	}

	public void setOrden(Integer orden) {
		this.orden = orden;
	}

	public Formulario getFormulario() {
		return formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public List<Pregunta> getPreguntaLista() {
		return preguntaLista;
	}

	public void setPreguntaLista(List<Pregunta> preguntaLista) {
		this.preguntaLista = preguntaLista;
	}

	public Pregunta getPadre() {
		return padre;
	}

	public void setPadre(Pregunta padre) {
		this.padre = padre;
	}

	public TipoPregunta getTipoPregunta() {
		return tipoPregunta;
	}

	public void setTipoPregunta(TipoPregunta tipoPregunta) {
		this.tipoPregunta = tipoPregunta;
	}

	public Respuesta getRespuesta() {
		return respuesta;
	}

	public void setRespuesta(Respuesta respuesta) {
		this.respuesta = respuesta;
	}

}
