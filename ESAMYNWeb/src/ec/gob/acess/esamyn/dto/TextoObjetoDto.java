package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

public class TextoObjetoDto implements Serializable {

    private static final long serialVersionUID = 3524289730494969860L;

    private Long codigo;

    private String texto;

    /**
     * @return the codigo
     */
    public Long getCodigo() {
	return codigo;
    }

    /**
     * @param codigo
     *            the codigo to set
     */
    public void setCodigo(Long codigo) {
	this.codigo = codigo;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
	return texto;
    }

    /**
     * @param texto
     *            the texto to set
     */
    public void setTexto(String texto) {
	this.texto = texto;
    }

}
