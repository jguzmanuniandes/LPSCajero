import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;

public aspect Consignacion {

	pointcut agregarConsignacion() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning(List<Comando> resultado): agregarConsignacion() {
		resultado.add(new ComandoConsignar());
	  }
}