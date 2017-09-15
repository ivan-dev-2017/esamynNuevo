package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
//github.com/jybaro/esamyn.git
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_parametro
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_parametro")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "catalogo")
public class Parametro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "par_id")
    private Long codigo;
    @Column(name = "par_puntaje")
    private Integer puntaje;
    @Column(name = "par_texto")
    private String texto;
    @Basic(optional = false)
    @Column(name = "par_obligatorio")
    private int obligatorio;
    @Basic(optional = false)
    @Column(name = "par_umbral")
    private int umbral;
    @Basic(optional = false)
    @Column(name = "par_cantidad_minima")
    private BigDecimal cantidadMinima;

    @Column(name = "par_codigo")
    private String codigoParametro;

    @JoinColumn(name = "par_condicion_no_aplica", referencedColumnName = "cna_id")
    @ManyToOne
    private CondicionNoAplica condicionNoAplica;
    @JoinColumn(name = "par_grupo_parametro", referencedColumnName = "gpa_id")
    @ManyToOne
    private GrupoParametro grupoParametro;
    @XmlTransient
    @Transient
    private List<Verificador> verificadorList;
    @XmlTransient
    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "parametro")
    private List<ParametroPregunta> parametroPreguntaList;

    @XmlTransient
    @Transient
    private List<Long> codigoPreguntaList;

    public Long getCodigo() {
	return codigo;
    }

    public void setCodigo(Long codigo) {
	this.codigo = codigo;
    }

    public Integer getPuntaje() {
	return puntaje;
    }

    public void setPuntaje(Integer puntaje) {
	this.puntaje = puntaje;
    }

    public String getTexto() {
	return texto;
    }

    public void setTexto(String texto) {
	this.texto = texto;
    }

    public int getObligatorio() {
	return obligatorio;
    }

    public void setObligatorio(int obligatorio) {
	this.obligatorio = obligatorio;
    }

    public int getUmbral() {
	return umbral;
    }

    public void setUmbral(int umbral) {
	this.umbral = umbral;
    }

    public CondicionNoAplica getCondicionNoAplica() {
	return condicionNoAplica;
    }

    public void setCondicionNoAplica(CondicionNoAplica condicionNoAplica) {
	this.condicionNoAplica = condicionNoAplica;
    }

    public GrupoParametro getGrupoParametro() {
	return grupoParametro;
    }

    public void setGrupoParametro(GrupoParametro grupoParametro) {
	this.grupoParametro = grupoParametro;
    }

    public List<Verificador> getVerificadorList() {
	return verificadorList;
    }

    public void setVerificadorList(List<Verificador> verificadorList) {
	this.verificadorList = verificadorList;
    }

    public List<ParametroPregunta> getParametroPreguntaList() {
	return parametroPreguntaList;
    }

    public void setParametroPreguntaList(List<ParametroPregunta> parametroPreguntaList) {
	this.parametroPreguntaList = parametroPreguntaList;
    }

    /**
     * @return the cantidadMinima
     */
    public BigDecimal getCantidadMinima() {
	return cantidadMinima;
    }

    /**
     * @param cantidadMinima
     *            the cantidadMinima to set
     */
    public void setCantidadMinima(BigDecimal cantidadMinima) {
	this.cantidadMinima = cantidadMinima;
    }

    public List<Long> getCodigoPreguntaList() {
	if (codigoPreguntaList == null) {
	    codigoPreguntaList = new ArrayList<Long>();

	    if (this.parametroPreguntaList != null && !this.parametroPreguntaList.isEmpty()) {
		Set<Long> idPreguntaSet = new HashSet<Long>();
		for (ParametroPregunta parametroPregunta : this.parametroPreguntaList) {
		    idPreguntaSet.add(parametroPregunta.getPregunta().getCodigo());
		}

		codigoPreguntaList = new ArrayList<Long>(idPreguntaSet);
	    }
	}
	return codigoPreguntaList;
    }

    public void setCodigoPreguntaList(List<Long> codigoPreguntaList) {
	this.codigoPreguntaList = codigoPreguntaList;
    }

    /**
     * @return the codigoParametro
     */
    public String getCodigoParametro() {
        return codigoParametro;
    }

    /**
     * @param codigoParametro the codigoParametro to set
     */
    public void setCodigoParametro(String codigoParametro) {
        this.codigoParametro = codigoParametro;
    }
    
    

}
