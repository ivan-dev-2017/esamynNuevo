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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_tipo_grupo_parametro")
public class TipoGrupoParametro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tgp_id")
    private Long tgpId;
    @Column(name = "tgp_texto")
    private String tgpTexto;
    @OneToMany(mappedBy = "gpaTipoGrupoParametro")
    private List<GrupoParametro> grupoParametroList;

    public TipoGrupoParametro() {
    }

    public TipoGrupoParametro(Long tgpId) {
        this.tgpId = tgpId;
    }

    public Long getTgpId() {
        return tgpId;
    }

    public void setTgpId(Long tgpId) {
        this.tgpId = tgpId;
    }

    public String getTgpTexto() {
        return tgpTexto;
    }

    public void setTgpTexto(String tgpTexto) {
        this.tgpTexto = tgpTexto;
    }

    @XmlTransient
    public List<GrupoParametro> getGrupoParametroList() {
        return grupoParametroList;
    }

    public void setGrupoParametroList(List<GrupoParametro> grupoParametroList) {
        this.grupoParametroList = grupoParametroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tgpId != null ? tgpId.hashCode() : 0);
        return hash;
    }

    @Override
    public String toString() {
        return "org.ops.modelo.TipoGrupoParametro[ tgpId=" + tgpId + " ]";
    }
    
}
