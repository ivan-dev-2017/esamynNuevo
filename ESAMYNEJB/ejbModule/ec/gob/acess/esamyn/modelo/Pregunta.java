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
    @XmlTransient
    private List<Pregunta> preguntaLista;
    @JoinColumn(name = "prg_padre", referencedColumnName = "prg_id")
    @ManyToOne(fetch = FetchType.LAZY)
    @XmlTransient
    private Pregunta padre;
    @JoinColumn(name = "prg_tipo_pregunta", referencedColumnName = "tpp_id")
    @ManyToOne
    private TipoPregunta tipoPregunta;
    @Transient
    @XmlTransient
    private Respuesta respuesta;

    public Pregunta() {
    }

    /**
     * @return the codigo
     */
    public Long getCodigo() {
	return codigo;
    }

    /**
     * @param codigo
     *            the codigo to set
     */
    public void setCodigo(Long codigo) {
	this.codigo = codigo;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
	return texto;
    }

    /**
     * @param texto
     *            the texto to set
     */
    public void setTexto(String texto) {
	this.texto = texto;
    }

    /**
     * @return the codigoVerificacion
     */
    public String getCodigoVerificacion() {
	return codigoVerificacion;
    }

    /**
     * @param codigoVerificacion
     *            the codigoVerificacion to set
     */
    public void setCodigoVerificacion(String codigoVerificacion) {
	this.codigoVerificacion = codigoVerificacion;
    }

    /**
     * @return the ayuda
     */
    public String getAyuda() {
	return ayuda;
    }

    /**
     * @param ayuda
     *            the ayuda to set
     */
    public void setAyuda(String ayuda) {
	this.ayuda = ayuda;
    }

    /**
     * @return the prefijo
     */
    public String getPrefijo() {
	return prefijo;
    }

    /**
     * @param prefijo
     *            the prefijo to set
     */
    public void setPrefijo(String prefijo) {
	this.prefijo = prefijo;
    }

    /**
     * @return the subfijo
     */
    public String getSubfijo() {
	return subfijo;
    }

    /**
     * @param subfijo
     *            the subfijo to set
     */
    public void setSubfijo(String subfijo) {
	this.subfijo = subfijo;
    }

    /**
     * @return the validacion
     */
    public String getValidacion() {
	return validacion;
    }

    /**
     * @param validacion
     *            the validacion to set
     */
    public void setValidacion(String validacion) {
	this.validacion = validacion;
    }

    /**
     * @return the orden
     */
    public Integer getOrden() {
	return orden;
    }

    /**
     * @param orden
     *            the orden to set
     */
    public void setOrden(Integer orden) {
	this.orden = orden;
    }

    /**
     * @return the formulario
     */
    public Formulario getFormulario() {
	return formulario;
    }

    /**
     * @param formulario
     *            the formulario to set
     */
    public void setFormulario(Formulario formulario) {
	this.formulario = formulario;
    }

    /**
     * @return the preguntaLista
     */
    public List<Pregunta> getPreguntaLista() {
	return preguntaLista;
    }

    /**
     * @param preguntaLista
     *            the preguntaLista to set
     */
    public void setPreguntaLista(List<Pregunta> preguntaLista) {
	this.preguntaLista = preguntaLista;
    }

    /**
     * @return the padre
     */
    public Pregunta getPadre() {
	return padre;
    }

    /**
     * @param padre
     *            the padre to set
     */
    public void setPadre(Pregunta padre) {
	this.padre = padre;
    }

    /**
     * @return the tipoPregunta
     */
    public TipoPregunta getTipoPregunta() {
	return tipoPregunta;
    }

    /**
     * @param tipoPregunta
     *            the tipoPregunta to set
     */
    public void setTipoPregunta(TipoPregunta tipoPregunta) {
	this.tipoPregunta = tipoPregunta;
    }

    /**
     * @return the respuesta
     */
    public Respuesta getRespuesta() {
	return respuesta;
    }

    /**
     * @param respuesta
     *            the respuesta to set
     */
    public void setRespuesta(Respuesta respuesta) {
	this.respuesta = respuesta;
    }

}
