package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_parametro_pregunta")
public class ParametroPregunta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ppr_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "ppr_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "ppr_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@JoinColumn(name = "ppr_parametro", referencedColumnName = "par_id")
	@ManyToOne(optional = false)
	private Parametro parametro;
	@JoinColumn(name = "ppr_pregunta", referencedColumnName = "prg_id")
	@ManyToOne(optional = false)
	private Pregunta pregunta;

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

	public Parametro getParametro() {
		return parametro;
	}

	public void setParametro(Parametro parametro) {
		this.parametro = parametro;
	}

	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}

}
