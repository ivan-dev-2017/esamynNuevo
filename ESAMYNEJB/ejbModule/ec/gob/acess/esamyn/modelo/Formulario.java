package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import ec.gob.acess.esamyn.dto.FormularioDto;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_formulario
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_formulario")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "formulario")
public class Formulario implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "frm_id")
	private Long codigo;
	@Column(name = "frm_nombre")
	@XmlTransient
	private String nombre;
	@Column(name = "frm_titulo")
	private String titulo;
	@Column(name = "frm_subtitulo")
	private String subtitulo;
	@Column(name = "frm_ayuda")
	private String ayuda;
	@Column(name = "frm_clave")
	private String clave;
	@Transient
	private List<FormularioDto> contestadosLista;

	public Formulario() {
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

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getSubtitulo() {
		return subtitulo;
	}

	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}

	public String getAyuda() {
		return ayuda;
	}

	public void setAyuda(String ayuda) {
		this.ayuda = ayuda;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public List<FormularioDto> getContestadosLista() {
		return contestadosLista;
	}

	public void setContestadosLista(List<FormularioDto> contestadosLista) {
		this.contestadosLista = contestadosLista;
	}

}
