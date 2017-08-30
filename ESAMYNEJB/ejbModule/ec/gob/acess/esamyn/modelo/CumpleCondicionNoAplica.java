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
 * Entidad que refleja la estructura de tabla esa_cumple_condicion_no_aplica
 * 
 * @author Duval Barragan
 * @date Aug 29, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_cumple_condicion_no_aplica")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "cumple condicion no aplica")
public class CumpleCondicionNoAplica implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ccn_id")
	private Long codigo;

	@Basic(optional = false)
	@XmlTransient
	@Column(name = "ccn_cumple")
	private int cumple;
	@Transient
	private List<Verificador> verificadorLista;
	@JoinColumn(name = "ccn_condicion_no_aplica", referencedColumnName = "cna_id")
	@ManyToOne(optional = false)
	private CondicionNoAplica condicionNoAplica;

	@JoinColumn(name = "ccn_evaluacion", referencedColumnName = "eva_id")
	@ManyToOne(optional = false)
	private Evaluacion evaluacion;

	public CumpleCondicionNoAplica() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public int getCumple() {
		return cumple;
	}

	public void setCumple(int cumple) {
		this.cumple = cumple;
	}

	public List<Verificador> getVerificadorLista() {
		return verificadorLista;
	}

	public void setVerificadorLista(List<Verificador> verificadorLista) {
		this.verificadorLista = verificadorLista;
	}

	public CondicionNoAplica getCondicionNoAplica() {
		return condicionNoAplica;
	}

	public void setCondicionNoAplica(CondicionNoAplica condicionNoAplica) {
		this.condicionNoAplica = condicionNoAplica;
	}

	public Evaluacion getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

}
