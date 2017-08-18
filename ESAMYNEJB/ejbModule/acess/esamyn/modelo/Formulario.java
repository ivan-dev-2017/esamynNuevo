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
@Table(name = "esa_formulario")
public class Formulario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "frm_id")
    private Long frmId;
    @Basic(optional = false)
    @Column(name = "frm_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date frmCreado;
    @Basic(optional = false)
    @Column(name = "frm_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date frmModificado;
    @Column(name = "frm_nombre")
    private String frmNombre;
    @Column(name = "frm_titulo")
    private String frmTitulo;
    @Column(name = "frm_subtitulo")
    private String frmSubtitulo;
    @Column(name = "frm_ayuda")
    private String frmAyuda;
    @Column(name = "frm_clave")
    private String frmClave;
    @OneToMany(mappedBy = "prgFormulario")
    private List<Pregunta> preguntaList;
    @OneToMany(mappedBy = "encFormulario")
    private List<Encuesta> encuestaList;

    public Formulario() {
    }

    public Formulario(Long frmId) {
        this.frmId = frmId;
    }

    public Formulario(Long frmId, Date frmCreado, Date frmModificado) {
        this.frmId = frmId;
        this.frmCreado = frmCreado;
        this.frmModificado = frmModificado;
    }

    public Long getFrmId() {
        return frmId;
    }

    public void setFrmId(Long frmId) {
        this.frmId = frmId;
    }

    public Date getFrmCreado() {
        return frmCreado;
    }

    public void setFrmCreado(Date frmCreado) {
        this.frmCreado = frmCreado;
    }

    public Date getFrmModificado() {
        return frmModificado;
    }

    public void setFrmModificado(Date frmModificado) {
        this.frmModificado = frmModificado;
    }

    public String getFrmNombre() {
        return frmNombre;
    }

    public void setFrmNombre(String frmNombre) {
        this.frmNombre = frmNombre;
    }

    public String getFrmTitulo() {
        return frmTitulo;
    }

    public void setFrmTitulo(String frmTitulo) {
        this.frmTitulo = frmTitulo;
    }

    public String getFrmSubtitulo() {
        return frmSubtitulo;
    }

    public void setFrmSubtitulo(String frmSubtitulo) {
        this.frmSubtitulo = frmSubtitulo;
    }

    public String getFrmAyuda() {
        return frmAyuda;
    }

    public void setFrmAyuda(String frmAyuda) {
        this.frmAyuda = frmAyuda;
    }

    public String getFrmClave() {
        return frmClave;
    }

    public void setFrmClave(String frmClave) {
        this.frmClave = frmClave;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    @XmlTransient
    public List<Encuesta> getEncuestaList() {
        return encuestaList;
    }

    public void setEncuestaList(List<Encuesta> encuestaList) {
        this.encuestaList = encuestaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (frmId != null ? frmId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Formulario[ frmId=" + frmId + " ]";
    }
    
}
