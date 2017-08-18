/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.math.BigInteger;
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
@Table(name = "esa_respuesta")
public class Respuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "res_id")
    private Long resId;
    @Basic(optional = false)
    @Column(name = "res_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date resCreado;
    @Basic(optional = false)
    @Column(name = "res_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date resModificado;
    @Column(name = "res_creado_por")
    private String resCreadoPor;
    @Column(name = "res_modificado_por")
    private String resModificadoPor;
    @Column(name = "res_valor_numero")
    private BigInteger resValorNumero;
    @Column(name = "res_valor_texto")
    private String resValorTexto;
    @Column(name = "res_valor_fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date resValorFecha;
    @JoinColumn(name = "res_encuesta", referencedColumnName = "enc_id")
    @ManyToOne
    private Encuesta resEncuesta;
    @JoinColumn(name = "res_pregunta", referencedColumnName = "prg_id")
    @ManyToOne
    private Pregunta resPregunta;

    public Respuesta() {
    }

    public Respuesta(Long resId) {
        this.resId = resId;
    }

    public Respuesta(Long resId, Date resCreado, Date resModificado) {
        this.resId = resId;
        this.resCreado = resCreado;
        this.resModificado = resModificado;
    }

    public Long getResId() {
        return resId;
    }

    public void setResId(Long resId) {
        this.resId = resId;
    }

    public Date getResCreado() {
        return resCreado;
    }

    public void setResCreado(Date resCreado) {
        this.resCreado = resCreado;
    }

    public Date getResModificado() {
        return resModificado;
    }

    public void setResModificado(Date resModificado) {
        this.resModificado = resModificado;
    }

    public String getResCreadoPor() {
        return resCreadoPor;
    }

    public void setResCreadoPor(String resCreadoPor) {
        this.resCreadoPor = resCreadoPor;
    }

    public String getResModificadoPor() {
        return resModificadoPor;
    }

    public void setResModificadoPor(String resModificadoPor) {
        this.resModificadoPor = resModificadoPor;
    }

    public BigInteger getResValorNumero() {
        return resValorNumero;
    }

    public void setResValorNumero(BigInteger resValorNumero) {
        this.resValorNumero = resValorNumero;
    }

    public String getResValorTexto() {
        return resValorTexto;
    }

    public void setResValorTexto(String resValorTexto) {
        this.resValorTexto = resValorTexto;
    }

    public Date getResValorFecha() {
        return resValorFecha;
    }

    public void setResValorFecha(Date resValorFecha) {
        this.resValorFecha = resValorFecha;
    }

    public Encuesta getResEncuesta() {
        return resEncuesta;
    }

    public void setResEncuesta(Encuesta resEncuesta) {
        this.resEncuesta = resEncuesta;
    }

    public Pregunta getResPregunta() {
        return resPregunta;
    }

    public void setResPregunta(Pregunta resPregunta) {
        this.resPregunta = resPregunta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (resId != null ? resId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Respuesta[ resId=" + resId + " ]";
    }
    
}
