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
@Table(name = "esa_persona_juridica")
public class PersonaJuridica implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pju_id")
    private Long pjuId;
    @Basic(optional = false)
    @Column(name = "pju_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date pjuCreado;
    @Basic(optional = false)
    @Column(name = "pju_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date pjuModificado;
    @Column(name = "pju_razon_social")
    private String pjuRazonSocial;
    @Column(name = "pju_ruc")
    private String pjuRuc;
    @OneToMany(mappedBy = "essPersonaJuridica")
    private List<EstablecimientoSalud> establecimientoSaludList;

    public PersonaJuridica() {
    }

    public PersonaJuridica(Long pjuId) {
        this.pjuId = pjuId;
    }

    public PersonaJuridica(Long pjuId, Date pjuCreado, Date pjuModificado) {
        this.pjuId = pjuId;
        this.pjuCreado = pjuCreado;
        this.pjuModificado = pjuModificado;
    }

    public Long getPjuId() {
        return pjuId;
    }

    public void setPjuId(Long pjuId) {
        this.pjuId = pjuId;
    }

    public Date getPjuCreado() {
        return pjuCreado;
    }

    public void setPjuCreado(Date pjuCreado) {
        this.pjuCreado = pjuCreado;
    }

    public Date getPjuModificado() {
        return pjuModificado;
    }

    public void setPjuModificado(Date pjuModificado) {
        this.pjuModificado = pjuModificado;
    }

    public String getPjuRazonSocial() {
        return pjuRazonSocial;
    }

    public void setPjuRazonSocial(String pjuRazonSocial) {
        this.pjuRazonSocial = pjuRazonSocial;
    }

    public String getPjuRuc() {
        return pjuRuc;
    }

    public void setPjuRuc(String pjuRuc) {
        this.pjuRuc = pjuRuc;
    }

    @XmlTransient
    public List<EstablecimientoSalud> getEstablecimientoSaludList() {
        return establecimientoSaludList;
    }

    public void setEstablecimientoSaludList(List<EstablecimientoSalud> establecimientoSaludList) {
        this.establecimientoSaludList = establecimientoSaludList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pjuId != null ? pjuId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.PersonaJuridica[ pjuId=" + pjuId + " ]";
    }
    
}
