package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

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
    private Long codigo;
    @Basic(optional = false)
    @Column(name = "pju_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creado;
    @Basic(optional = false)
    @Column(name = "pju_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificado;
    @Column(name = "pju_razon_social")
    private String razonSocial;
    @Column(name = "pju_ruc")
    private String ruc;
    @Transient
    private List<EstablecimientoSalud> establecimientoSaludLista;

    public PersonaJuridica() {
    }

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Date getCreado() {
		return creado;
	}

	public void setCreado(Date creado) {
		this.creado = creado;
	}

	public Date getModificado() {
		return modificado;
	}

	public void setModificado(Date modificado) {
		this.modificado = modificado;
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
