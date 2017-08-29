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
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_condicion_na")
public class CondicionNa implements Serializable {

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
    private List<CumpleCondicionNa> cumpleCondicionNaList;
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
	public List<CumpleCondicionNa> getCumpleCondicionNaList() {
		return cumpleCondicionNaList;
	}
	public void setCumpleCondicionNaList(List<CumpleCondicionNa> cumpleCondicionNaList) {
		this.cumpleCondicionNaList = cumpleCondicionNaList;
	}

  
    
}
