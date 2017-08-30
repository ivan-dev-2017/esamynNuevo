package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_persona_juridica
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_persona_juridica")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "persona jurdidica")
public class PersonaJuridica implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pju_id")
    private Long codigo;
    @Column(name = "pju_razon_social")
    private String razonSocial;
    @Column(name = "pju_ruc")
    private String ruc;
    @Transient
    @XmlTransient
    private List<EstablecimientoSalud> establecimientoSaludLista;

    public PersonaJuridica() {
    }

    public Long getCodigo() {
	return codigo;
    }

    public void setCodigo(Long codigo) {
	this.codigo = codigo;
    }

    public String getRazonSocial() {
	return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
	this.razonSocial = razonSocial;
    }

    public String getRuc() {
	return ruc;
    }

    public void setRuc(String ruc) {
	this.ruc = ruc;
    }

    public List<EstablecimientoSalud> getEstablecimientoSaludLista() {
	return establecimientoSaludLista;
    }

    public void setEstablecimientoSaludLista(List<EstablecimientoSalud> establecimientoSaludLista) {
	this.establecimientoSaludLista = establecimientoSaludLista;
    }

}
