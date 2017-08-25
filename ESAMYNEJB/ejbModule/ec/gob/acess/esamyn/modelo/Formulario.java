package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_formulario")
public class Formulario implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "frm_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "frm_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "frm_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Column(name = "frm_nombre")
	private String nombre;
	@Column(name = "frm_titulo")
	private String titulo;
	@Column(name = "frm_subtitulo")
	private String subtitulo;
	@Column(name = "frm_ayuda")
	private String ayuda;
	@Column(name = "frm_clave")
	private String clave;

	public Formulario() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Date getCreado() {
		return creado;
	}

	public void setCreado(Date creado) {
		this.creado = creado;
	}

	public Date getModificado() {
		return modificado;
	}

	public void setModificado(Date modificado) {
		this.modificado = modificado;
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

}
