/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
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
@Table(name = "esa_verificador")
public class Verificador implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ver_id")
    private Long verId;
    @Basic(optional = false)
    @Column(name = "ver_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date verCreado;
    @Basic(optional = false)
    @Column(name = "ver_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date verModificado;
    @Basic(optional = false)
    @Column(name = "ver_cumple")
    private int verCumple;
    @Basic(optional = false)
    @Column(name = "ver_no_aplica")
    private int verNoAplica;
    @Basic(optional = false)
    @Column(name = "ver_cantidad_medidas")
    private int verCantidadMedidas;
    @JoinColumn(name = "ver_evaluacion", referencedColumnName = "eva_id")
    @ManyToOne
    private Evaluacion verEvaluacion;
    @JoinColumn(name = "ver_parametro", referencedColumnName = "par_id")
    @ManyToOne
    private Parametro verParametro;

    public Verificador() {
    }

    public Verificador(Long verId) {
        this.verId = verId;
    }

    public Verificador(Long verId, Date verCreado, Date verModificado, int verCumple, int verNoAplica, int verCantidadMedidas) {
        this.verId = verId;
        this.verCreado = verCreado;
        this.verModificado = verModificado;
        this.verCumple = verCumple;
        this.verNoAplica = verNoAplica;
        this.verCantidadMedidas = verCantidadMedidas;
    }

    public Long getVerId() {
        return verId;
    }

    public void setVerId(Long verId) {
        this.verId = verId;
    }

    public Date getVerCreado() {
        return verCreado;
    }

    public void setVerCreado(Date verCreado) {
        this.verCreado = verCreado;
    }

    public Date getVerModificado() {
        return verModificado;
    }

    public void setVerModificado(Date verModificado) {
        this.verModificado = verModificado;
    }

    public int getVerCumple() {
        return verCumple;
    }

    public void setVerCumple(int verCumple) {
        this.verCumple = verCumple;
    }

    public int getVerNoAplica() {
        return verNoAplica;
    }

    public void setVerNoAplica(int verNoAplica) {
        this.verNoAplica = verNoAplica;
    }

    public int getVerCantidadMedidas() {
        return verCantidadMedidas;
    }

    public void setVerCantidadMedidas(int verCantidadMedidas) {
        this.verCantidadMedidas = verCantidadMedidas;
    }

    public Evaluacion getVerEvaluacion() {
        return verEvaluacion;
    }

    public void setVerEvaluacion(Evaluacion verEvaluacion) {
        this.verEvaluacion = verEvaluacion;
    }

    public Parametro getVerParametro() {
        return verParametro;
    }

    public void setVerParametro(Parametro verParametro) {
        this.verParametro = verParametro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (verId != null ? verId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Verificador[ verId=" + verId + " ]";
    }
    
}
