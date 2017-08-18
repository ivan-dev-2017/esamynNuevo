/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_pregunta")
public class Pregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "prg_id")
    private Long prgId;
    @Basic(optional = false)
    @Column(name = "prg_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date prgCreado;
    @Basic(optional = false)
    @Column(name = "prg_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date prgModificado;
    @Column(name = "prg_texto")
    private String prgTexto;
    @Column(name = "prg_codigo_verificacion")
    private String prgCodigoVerificacion;
    @Column(name = "prg_ayuda")
    private String prgAyuda;
    @Column(name = "prg_prefijo")
    private String prgPrefijo;
    @Column(name = "prg_subfijo")
    private String prgSubfijo;
    @Column(name = "prg_validacion")
    private String prgValidacion;
    @Column(name = "prg_orden")
    private Integer prgOrden;
    @JoinColumn(name = "prg_formulario", referencedColumnName = "frm_id")
    @ManyToOne
    private Formulario prgFormulario;
    @OneToMany(mappedBy = "prgPadre")
    private List<Pregunta> preguntaList;
    @JoinColumn(name = "prg_padre", referencedColumnName = "prg_id")
    @ManyToOne
    private Pregunta prgPadre;
    @JoinColumn(name = "prg_tipo_pregunta", referencedColumnName = "tpp_id")
    @ManyToOne
    private TipoPregunta prgTipoPregunta;
    @OneToMany(mappedBy = "parPregunta")
    private List<Parametro> parametroList;
    @OneToMany(mappedBy = "resPregunta")
    private List<Respuesta> respuestaList;

    public Pregunta() {
    }

    public Pregunta(Long prgId) {
        this.prgId = prgId;
    }

    public Pregunta(Long prgId, Date prgCreado, Date prgModificado) {
        this.prgId = prgId;
        this.prgCreado = prgCreado;
        this.prgModificado = prgModificado;
    }

    public Long getPrgId() {
        return prgId;
    }

    public void setPrgId(Long prgId) {
        this.prgId = prgId;
    }

    public Date getPrgCreado() {
        return prgCreado;
    }

    public void setPrgCreado(Date prgCreado) {
        this.prgCreado = prgCreado;
    }

    public Date getPrgModificado() {
        return prgModificado;
    }

    public void setPrgModificado(Date prgModificado) {
        this.prgModificado = prgModificado;
    }

    public String getPrgTexto() {
        return prgTexto;
    }

    public void setPrgTexto(String prgTexto) {
        this.prgTexto = prgTexto;
    }

    public String getPrgCodigoVerificacion() {
        return prgCodigoVerificacion;
    }

    public void setPrgCodigoVerificacion(String prgCodigoVerificacion) {
        this.prgCodigoVerificacion = prgCodigoVerificacion;
    }

    public String getPrgAyuda() {
        return prgAyuda;
    }

    public void setPrgAyuda(String prgAyuda) {
        this.prgAyuda = prgAyuda;
    }

    public String getPrgPrefijo() {
        return prgPrefijo;
    }

    public void setPrgPrefijo(String prgPrefijo) {
        this.prgPrefijo = prgPrefijo;
    }

    public String getPrgSubfijo() {
        return prgSubfijo;
    }

    public void setPrgSubfijo(String prgSubfijo) {
        this.prgSubfijo = prgSubfijo;
    }

    public String getPrgValidacion() {
        return prgValidacion;
    }

    public void setPrgValidacion(String prgValidacion) {
        this.prgValidacion = prgValidacion;
    }

    public Integer getPrgOrden() {
        return prgOrden;
    }

    public void setPrgOrden(Integer prgOrden) {
        this.prgOrden = prgOrden;
    }

    public Formulario getPrgFormulario() {
        return prgFormulario;
    }

    public void setPrgFormulario(Formulario prgFormulario) {
        this.prgFormulario = prgFormulario;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    public Pregunta getPrgPadre() {
        return prgPadre;
    }

    public void setPrgPadre(Pregunta prgPadre) {
        this.prgPadre = prgPadre;
    }

    public TipoPregunta getPrgTipoPregunta() {
        return prgTipoPregunta;
    }

    public void setPrgTipoPregunta(TipoPregunta prgTipoPregunta) {
        this.prgTipoPregunta = prgTipoPregunta;
    }

    @XmlTransient
    public List<Parametro> getParametroList() {
        return parametroList;
    }

    public void setParametroList(List<Parametro> parametroList) {
        this.parametroList = parametroList;
    }

    @XmlTransient
    public List<Respuesta> getRespuestaList() {
        return respuestaList;
    }

    public void setRespuestaList(List<Respuesta> respuestaList) {
        this.respuestaList = respuestaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (prgId != null ? prgId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Pregunta[ prgId=" + prgId + " ]";
    }
    
}
