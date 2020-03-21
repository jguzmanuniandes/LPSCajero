import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoTransferir;

public aspect Transferencia {

	pointcut agregarTransferencia() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning(List<Comando> resultado): agregarTransferencia() {
		resultado.add(new ComandoTransferir());
	  }
}