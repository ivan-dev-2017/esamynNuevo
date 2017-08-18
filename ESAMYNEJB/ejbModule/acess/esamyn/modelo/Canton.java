/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_canton")
public class Canton implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "can_id")
    private Long canId;
    @Column(name = "can_nombre")
    private String canNombre;
    @Column(name = "can_codigo")
    private String canCodigo;
    @OneToMany(mappedBy = "essCanton")
    private List<EstablecimientoSalud> establecimientoSaludList;
    @JoinColumn(name = "can_provincia", referencedColumnName = "pro_id")
    @ManyToOne
    private Provincia canProvincia;

    public Canton() {
    }

    public Canton(Long canId) {
        this.canId = canId;
    }

    public Long getCanId() {
        return canId;
    }

    public void setCanId(Long canId) {
        this.canId = canId;
    }

    public String getCanNombre() {
        return canNombre;
    }

    public void setCanNombre(String canNombre) {
        this.canNombre = canNombre;
    }

    public String getCanCodigo() {
        return canCodigo;
    }

    public void setCanCodigo(String canCodigo) {
        this.canCodigo = canCodigo;
    }

    @XmlTransient
    public List<EstablecimientoSalud> getEstablecimientoSaludList() {
        return establecimientoSaludList;
    }

    public void setEstablecimientoSaludList(List<EstablecimientoSalud> establecimientoSaludList) {
        this.establecimientoSaludList = establecimientoSaludList;
    }

    public Provincia getCanProvincia() {
        return canProvincia;
    }

    public void setCanProvincia(Provincia canProvincia) {
        this.canProvincia = canProvincia;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (canId != null ? canId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Canton[ canId=" + canId + " ]";
    }
    
}
