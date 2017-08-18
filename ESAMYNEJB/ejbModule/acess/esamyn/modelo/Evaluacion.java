/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.math.BigInteger;
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
@Table(name = "esa_evaluacion")
public class Evaluacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "eva_id")
    private Long evaId;
    @Basic(optional = false)
    @Column(name = "eva_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaCreado;
    @Basic(optional = false)
    @Column(name = "eva_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaModificado;
    @Column(name = "eva_creado_por")
    private String evaCreadoPor;
    @Column(name = "eva_modificado_por")
    private String evaModificadoPor;
    @Column(name = "eva_numero")
    private Integer evaNumero;
    @Column(name = "eva_calificacion")
    private BigInteger evaCalificacion;
    @Basic(optional = false)
    @Column(name = "eva_fecha_inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaFechaInicio;
    @Column(name = "eva_fecha_calificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaFechaCalificacion;
    @Basic(optional = false)
    @Column(name = "eva_cantidad_encuestas")
    private int evaCantidadEncuestas;
    @OneToMany(mappedBy = "verEvaluacion")
    private List<Verificador> verificadorList;
    @JoinColumn(name = "eva_establecimiento_salud", referencedColumnName = "ess_id")
    @ManyToOne
    private EstablecimientoSalud evaEstablecimientoSalud;
    @JoinColumn(name = "eva_usuario", referencedColumnName = "usu_id")
    @ManyToOne
    private Usuario evaUsuario;
    @OneToMany(mappedBy = "encEvaluacion")
    private List<Encuesta> encuestaList;

    public Evaluacion() {
    }

    public Evaluacion(Long evaId) {
        this.evaId = evaId;
    }

    public Evaluacion(Long evaId, Date evaCreado, Date evaModificado, Date evaFechaInicio, int evaCantidadEncuestas) {
        this.evaId = evaId;
        this.evaCreado = evaCreado;
        this.evaModificado = evaModificado;
        this.evaFechaInicio = evaFechaInicio;
        this.evaCantidadEncuestas = evaCantidadEncuestas;
    }

    public Long getEvaId() {
        return evaId;
    }

    public void setEvaId(Long evaId) {
        this.evaId = evaId;
    }

    public Date getEvaCreado() {
        return evaCreado;
    }

    public void setEvaCreado(Date evaCreado) {
        this.evaCreado = evaCreado;
    }

    public Date getEvaModificado() {
        return evaModificado;
    }

    public void setEvaModificado(Date evaModificado) {
        this.evaModificado = evaModificado;
    }

    public String getEvaCreadoPor() {
        return evaCreadoPor;
    }

    public void setEvaCreadoPor(String evaCreadoPor) {
        this.evaCreadoPor = evaCreadoPor;
    }

    public String getEvaModificadoPor() {
        return evaModificadoPor;
    }

    public void setEvaModificadoPor(String evaModificadoPor) {
        this.evaModificadoPor = evaModificadoPor;
    }

    public Integer getEvaNumero() {
        return evaNumero;
    }

    public void setEvaNumero(Integer evaNumero) {
        this.evaNumero = evaNumero;
    }

    public BigInteger getEvaCalificacion() {
        return evaCalificacion;
    }

    public void setEvaCalificacion(BigInteger evaCalificacion) {
        this.evaCalificacion = evaCalificacion;
    }

    public Date getEvaFechaInicio() {
        return evaFechaInicio;
    }

    public void setEvaFechaInicio(Date evaFechaInicio) {
        this.evaFechaInicio = evaFechaInicio;
    }

    public Date getEvaFechaCalificacion() {
        return evaFechaCalificacion;
    }

    public void setEvaFechaCalificacion(Date evaFechaCalificacion) {
        this.evaFechaCalificacion = evaFechaCalificacion;
    }

    public int getEvaCantidadEncuestas() {
        return evaCantidadEncuestas;
    }

    public void setEvaCantidadEncuestas(int evaCantidadEncuestas) {
        this.evaCantidadEncuestas = evaCantidadEncuestas;
    }

    @XmlTransient
    public List<Verificador> getVerificadorList() {
        return verificadorList;
    }

    public void setVerificadorList(List<Verificador> verificadorList) {
        this.verificadorList = verificadorList;
    }

    public EstablecimientoSalud getEvaEstablecimientoSalud() {
        return evaEstablecimientoSalud;
    }

    public void setEvaEstablecimientoSalud(EstablecimientoSalud evaEstablecimientoSalud) {
        this.evaEstablecimientoSalud = evaEstablecimientoSalud;
    }

    public Usuario getEvaUsuario() {
        return evaUsuario;
    }

    public void setEvaUsuario(Usuario evaUsuario) {
        this.evaUsuario = evaUsuario;
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
        hash += (evaId != null ? evaId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Evaluacion[ evaId=" + evaId + " ]";
    }
    
}
