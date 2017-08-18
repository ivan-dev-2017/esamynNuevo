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
@Table(name = "esa_establecimiento_salud")
public class EstablecimientoSalud implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ess_id")
    private Long essId;
    @Basic(optional = false)
    @Column(name = "ess_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date essCreado;
    @Basic(optional = false)
    @Column(name = "ess_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date essModificado;
    @Column(name = "ess_nombre")
    private String essNombre;
    @Column(name = "ess_unicodigo")
    private String essUnicodigo;
    @Column(name = "ess_direccion")
    private String essDireccion;
    @Column(name = "ess_latitud")
    private String essLatitud;
    @Column(name = "ess_longitud")
    private String essLongitud;
    @Column(name = "ess_telefono")
    private String essTelefono;
    @Column(name = "ess_correo_electronico")
    private String essCorreoElectronico;
    @Column(name = "ess_nombre_responsable")
    private String essNombreResponsable;
    @Column(name = "ess_zona")
    private String essZona;
    @Column(name = "ess_distrito")
    private String essDistrito;
    @JoinColumn(name = "ess_canton", referencedColumnName = "can_id")
    @ManyToOne
    private Canton essCanton;
    @JoinColumn(name = "ess_persona_juridica", referencedColumnName = "pju_id")
    @ManyToOne
    private PersonaJuridica essPersonaJuridica;
    @OneToMany(mappedBy = "evaEstablecimientoSalud")
    private List<Evaluacion> evaluacionList;

    public EstablecimientoSalud() {
    }

    public EstablecimientoSalud(Long essId) {
        this.essId = essId;
    }

    public EstablecimientoSalud(Long essId, Date essCreado, Date essModificado) {
        this.essId = essId;
        this.essCreado = essCreado;
        this.essModificado = essModificado;
    }

    public Long getEssId() {
        return essId;
    }

    public void setEssId(Long essId) {
        this.essId = essId;
    }

    public Date getEssCreado() {
        return essCreado;
    }

    public void setEssCreado(Date essCreado) {
        this.essCreado = essCreado;
    }

    public Date getEssModificado() {
        return essModificado;
    }

    public void setEssModificado(Date essModificado) {
        this.essModificado = essModificado;
    }

    public String getEssNombre() {
        return essNombre;
    }

    public void setEssNombre(String essNombre) {
        this.essNombre = essNombre;
    }

    public String getEssUnicodigo() {
        return essUnicodigo;
    }

    public void setEssUnicodigo(String essUnicodigo) {
        this.essUnicodigo = essUnicodigo;
    }

    public String getEssDireccion() {
        return essDireccion;
    }

    public void setEssDireccion(String essDireccion) {
        this.essDireccion = essDireccion;
    }

    public String getEssLatitud() {
        return essLatitud;
    }

    public void setEssLatitud(String essLatitud) {
        this.essLatitud = essLatitud;
    }

    public String getEssLongitud() {
        return essLongitud;
    }

    public void setEssLongitud(String essLongitud) {
        this.essLongitud = essLongitud;
    }

    public String getEssTelefono() {
        return essTelefono;
    }

    public void setEssTelefono(String essTelefono) {
        this.essTelefono = essTelefono;
    }

    public String getEssCorreoElectronico() {
        return essCorreoElectronico;
    }

    public void setEssCorreoElectronico(String essCorreoElectronico) {
        this.essCorreoElectronico = essCorreoElectronico;
    }

    public String getEssNombreResponsable() {
        return essNombreResponsable;
    }

    public void setEssNombreResponsable(String essNombreResponsable) {
        this.essNombreResponsable = essNombreResponsable;
    }

    public String getEssZona() {
        return essZona;
    }

    public void setEssZona(String essZona) {
        this.essZona = essZona;
    }

    public String getEssDistrito() {
        return essDistrito;
    }

    public void setEssDistrito(String essDistrito) {
        this.essDistrito = essDistrito;
    }

    public Canton getEssCanton() {
        return essCanton;
    }

    public void setEssCanton(Canton essCanton) {
        this.essCanton = essCanton;
    }

    public PersonaJuridica getEssPersonaJuridica() {
        return essPersonaJuridica;
    }

    public void setEssPersonaJuridica(PersonaJuridica essPersonaJuridica) {
        this.essPersonaJuridica = essPersonaJuridica;
    }

    @XmlTransient
    public List<Evaluacion> getEvaluacionList() {
        return evaluacionList;
    }

    public void setEvaluacionList(List<Evaluacion> evaluacionList) {
        this.evaluacionList = evaluacionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (essId != null ? essId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.EstablecimientoSalud[ essId=" + essId + " ]";
    }
    
}
