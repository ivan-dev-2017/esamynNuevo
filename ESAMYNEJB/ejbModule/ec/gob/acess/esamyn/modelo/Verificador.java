package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_verificador
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_verificador")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "verificador")
public class Verificador implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ver_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "ver_cumple")
	private int cumple;
	@Basic(optional = false)
	@Column(name = "ver_no_aplica")
	private int noAplica;
	@Basic(optional = false)
	@Column(name = "ver_cantidad_medidas")
	private int cantidadMedidas;
	@JoinColumn(name = "ver_evaluacion", referencedColumnName = "eva_id")
	@ManyToOne
	private Evaluacion evaluacion;
	@JoinColumn(name = "ver_parametro", referencedColumnName = "par_id")
	@ManyToOne
	private Parametro parametro;
	@JoinColumn(name = "ver_cumple_condicion_no_aplica", referencedColumnName = "ccn_id")
	@ManyToOne
	private CumpleCondicionNoAplica cumpleCondicionNoAplica;

	public Verificador() {
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

	public int getNoAplica() {
		return noAplica;
	}

	public void setNoAplica(int noAplica) {
		this.noAplica = noAplica;
	}

	public int getCantidadMedidas() {
		return cantidadMedidas;
	}

	public void setCantidadMedidas(int cantidadMedidas) {
		this.cantidadMedidas = cantidadMedidas;
	}

	public Evaluacion getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

	public Parametro getParametro() {
		return parametro;
	}

	public void setParametro(Parametro parametro) {
		this.parametro = parametro;
	}

	/**
	 * @return the cumpleCondicionNoAplica
	 */
	public CumpleCondicionNoAplica getCumpleCondicionNoAplica() {
	    return cumpleCondicionNoAplica;
	}

	/**
	 * @param cumpleCondicionNoAplica the cumpleCondicionNoAplica to set
	 */
	public void setCumpleCondicionNoAplica(CumpleCondicionNoAplica cumpleCondicionNoAplica) {
	    this.cumpleCondicionNoAplica = cumpleCondicionNoAplica;
	}



}
