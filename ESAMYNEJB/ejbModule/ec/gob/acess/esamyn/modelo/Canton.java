package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
    private Long codigo;
    @Column(name = "can_nombre")
    private String nombre;
    @Column(name = "can_codigo")
    private String codigoINEN;
 
    @JoinColumn(name = "can_provincia", referencedColumnName = "pro_id")
    @ManyToOne
    private Provincia provincia;

    public Canton() {
    }

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCodigoINEN() {
		return codigoINEN;
	}

	public void setCodigoINEN(String codigoINEN) {
		this.codigoINEN = codigoINEN;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

  
    
}
