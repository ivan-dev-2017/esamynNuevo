package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_condicion_no_aplica
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_condicion_no_aplica")
public class CondicionNoAplica implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "cna_id")
	private Long codigo;
	@Column(name = "cna_texto")
	private String cnaTexto;
	@Transient
	private List<Parametro> esaParametroCollection;
	@Transient
	private List<CumpleCondicionNoAplica> cumpleCondicionNaList;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getCnaTexto() {
		return cnaTexto;
	}

	public void setCnaTexto(String cnaTexto) {
		this.cnaTexto = cnaTexto;
	}

	public Collection<Parametro> getEsaParametroCollection() {
		return esaParametroCollection;
	}

	public void setEsaParametroCollection(List<Parametro> esaParametroCollection) {
		this.esaParametroCollection = esaParametroCollection;
	}

	public List<CumpleCondicionNoAplica> getCumpleCondicionNaList() {
		return cumpleCondicionNaList;
	}

	public void setCumpleCondicionNaList(List<CumpleCondicionNoAplica> cumpleCondicionNaList) {
		this.cumpleCondicionNaList = cumpleCondicionNaList;
	}

}
