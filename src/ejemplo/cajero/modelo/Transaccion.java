package ejemplo.cajero.modelo;

import java.time.LocalDateTime;

public class Transaccion {
	
	private String cuenta;
	private String tipoTransaccion;
	private LocalDateTime localDateTime;
	
	public Transaccion(String cuenta, String tipoTransaccion, LocalDateTime localDateTime) {
		this.cuenta = cuenta;
		this.tipoTransaccion = tipoTransaccion;
		this.localDateTime = localDateTime;
	}

	@Override
	public String toString() {
		return "Transaccion [cuenta=" + cuenta + ", tipoTransaccion=" + tipoTransaccion + ", localDateTime="
				+ localDateTime + "]";
	}

}
