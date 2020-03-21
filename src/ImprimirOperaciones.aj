import java.util.ArrayList;

import ejemplo.cajero.modelo.Transaccion;

public aspect ImprimirOperaciones {

	pointcut imprimirOperaciones() : call ( * getTransaccionesDiarias());
	
	after() returning(ArrayList<Transaccion> resultado): imprimirOperaciones() {
		
		resultado.forEach(System.out::println);
		
	  }
}