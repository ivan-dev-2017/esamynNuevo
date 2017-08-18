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
@Table(name = "esa_encuesta")
public class Encuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enc_id")
    private Long encId;
    @Basic(optional = false)
    @Column(name = "enc_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date encCreado;
    @Basic(optional = false)
    @Column(name = "enc_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date encModificado;
    @Column(name = "enc_creado_por")
    private String encCreadoPor;
    @Column(name = "enc_modificado_por")
    private String encModificadoPor;
    @Basic(optional = false)
    @Column(name = "enc_finalizada")
    private int encFinalizada;
    @Basic(optional = false)
    @Column(name = "enc_fecha_inicial")
    @Temporal(TemporalType.TIMESTAMP)
    private Date encFechaInicial;
    @Column(name = "enc_fecha_final")
    @Temporal(TemporalType.TIMESTAMP)
    private Date encFechaFinal;
    @OneToMany(mappedBy = "resEncuesta")
    private List<Respuesta> respuestaList;
    @JoinColumn(name = "enc_evaluacion", referencedColumnName = "eva_id")
    @ManyToOne
    private Evaluacion encEvaluacion;
    @JoinColumn(name = "enc_formulario", referencedColumnName = "frm_id")
    @ManyToOne
    private Formulario encFormulario;
    @JoinColumn(name = "enc_usuario", referencedColumnName = "usu_id")
    @ManyToOne
    private Usuario encUsuario;

    public Encuesta() {
    }

    public Encuesta(Long encId) {
        this.encId = encId;
    }

    public Encuesta(Long encId, Date encCreado, Date encModificado, int encFinalizada, Date encFechaInicial) {
        this.encId = encId;
        this.encCreado = encCreado;
        this.encModificado = encModificado;
        this.encFinalizada = encFinalizada;
        this.encFechaInicial = encFechaInicial;
    }

    public Long getEncId() {
        return encId;
    }

    public void setEncId(Long encId) {
        this.encId = encId;
    }

    public Date getEncCreado() {
        return encCreado;
    }

    public void setEncCreado(Date encCreado) {
        this.encCreado = encCreado;
    }

    public Date getEncModificado() {
        return encModificado;
    }

    public void setEncModificado(Date encModificado) {
        this.encModificado = encModificado;
    }

    public String getEncCreadoPor() {
        return encCreadoPor;
    }

    public void setEncCreadoPor(String encCreadoPor) {
        this.encCreadoPor = encCreadoPor;
    }

    public String getEncModificadoPor() {
        return encModificadoPor;
    }

    public void setEncModificadoPor(String encModificadoPor) {
        this.encModificadoPor = encModificadoPor;
    }

    public int getEncFinalizada() {
        return encFinalizada;
    }

    public void setEncFinalizada(int encFinalizada) {
        this.encFinalizada = encFinalizada;
    }

    public Date getEncFechaInicial() {
        return encFechaInicial;
    }

    public void setEncFechaInicial(Date encFechaInicial) {
        this.encFechaInicial = encFechaInicial;
    }

    public Date getEncFechaFinal() {
        return encFechaFinal;
    }

    public void setEncFechaFinal(Date encFechaFinal) {
        this.encFechaFinal = encFechaFinal;
    }

    @XmlTransient
    public List<Respuesta> getRespuestaList() {
        return respuestaList;
    }

    public void setRespuestaList(List<Respuesta> respuestaList) {
        this.respuestaList = respuestaList;
    }

    public Evaluacion getEncEvaluacion() {
        return encEvaluacion;
    }

    public void setEncEvaluacion(Evaluacion encEvaluacion) {
        this.encEvaluacion = encEvaluacion;
    }

    public Formulario getEncFormulario() {
        return encFormulario;
    }

    public void setEncFormulario(Formulario encFormulario) {
        this.encFormulario = encFormulario;
    }

    public Usuario getEncUsuario() {
        return encUsuario;
    }

    public void setEncUsuario(Usuario encUsuario) {
        this.encUsuario = encUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (encId != null ? encId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Encuesta[ encId=" + encId + " ]";
    }
    
}
