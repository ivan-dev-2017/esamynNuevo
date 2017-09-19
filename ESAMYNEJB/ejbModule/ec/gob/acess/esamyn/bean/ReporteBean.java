
package ec.gob.acess.esamyn.bean;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.dto.RespuestaDto;
import ec.gob.acess.esamyn.modelo.Formulario;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Clase que maneja la logica de clase Respuesta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class ReporteBean extends GenericServiceImpl<Respuesta, Long> {

    @EJB
    private RespuestaDAO respuestaDAO;

    @EJB
    private PreguntaBean preguntaBean;

    @EJB
    private FormularioBean formularioBean;

    @Override
    public GenericDao<Respuesta, Long> getDao() {
	return respuestaDAO;
    }

    public XSSFWorkbook generarDocumento(Long idFormulario, Long idEstablecimiento) throws IOException {

	Formulario formulario = formularioBean.findByPk(idFormulario);

	XSSFWorkbook workbook = new XSSFWorkbook();
	XSSFSheet sheet = workbook.createSheet(formulario.getTitulo());

	CellStyle headerStyle = workbook.createCellStyle();
	headerStyle.setFillBackgroundColor(IndexedColors.BLACK.getIndex());
	headerStyle.setAlignment(headerStyle.ALIGN_CENTER);
	headerStyle.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);

	// ENCABEZADO TABLAS
	Row row = sheet.createRow(0);

	Cell cell = row.createCell(0);
	cell.setCellStyle(headerStyle);
	cell = row.createCell(0);
	cell.setCellValue((String) "UNICODIGO");
	cell = row.createCell(1);
	cell.setCellValue((String) "SECUENCIAL");
	cell = row.createCell(2);
	cell.setCellValue((String) "RESPONSABLE");
	cell = row.createCell(3);
	cell.setCellValue((String) "CARGO");
	cell = row.createCell(4);
	cell.setCellValue((String) "CREADO pOR");
	cell = row.createCell(5);
	cell.setCellValue((String) "FECHA DE INICIO EVALUACION");
	cell = row.createCell(6);
	cell.setCellValue((String) "FECHA DE INICIO ENCUESTA");
	cell = row.createCell(7);
	cell.setCellValue((String) "FINALIZADA?");

	Map<Long, String> mapaPreguntas = preguntaBean.buscarPreguntas(idFormulario);

	int cont = 8;
	for (Map.Entry<Long, String> pregunta : mapaPreguntas.entrySet()) {

	    cell = row.createCell(cont);
	    cell.setCellValue((String) pregunta.getValue());

	    cont++;
	}

	List<RespuestaDto> listaRespuesta = respuestaDAO.respuestasParaReporte(idFormulario, idEstablecimiento);

	// LLENA DATOS RESPUESTA

	int rowCount = 1;
	for (RespuestaDto respuestaDto : listaRespuesta) {

	    row = sheet.createRow(rowCount);
	    cell = row.createCell(0);
	    cell.setCellValue((String) respuestaDto.getUnicodigo());
	    cell = row.createCell(1);
	    cell.setCellValue((Long) respuestaDto.getSecuencial());
	    cell = row.createCell(2);
	    cell.setCellValue((String) respuestaDto.getResponsable());
	    cell = row.createCell(3);
	    cell.setCellValue((String) respuestaDto.getCargo());
	    cell = row.createCell(4);
	    cell.setCellValue((String) respuestaDto.getCreadoPor());
	    cell = row.createCell(5);
	    cell.setCellValue((String) respuestaDto.getFechaEvaluacion());
	    cell = row.createCell(6);
	    cell.setCellValue((String) respuestaDto.getFechaEncuesta());
	    cell = row.createCell(7);
	    cell.setCellValue((String) respuestaDto.getFinalizada());

	    cont = 8;
	    for (Map.Entry<Long, String> pregunta : mapaPreguntas.entrySet()) {

		cell = row.createCell(cont);
		if (respuestaDto.getIdPregunta().equals(pregunta.getKey())) {
		    cell.setCellValue((String) respuestaDto.getRespuesta());
		}

		cont++;
	    }

	    rowCount++;
	}

	return workbook;

    }

}
