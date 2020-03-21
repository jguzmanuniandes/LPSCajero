package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

public class ComandoConsultar implements Comando {

	@Override
	public String getNombre() {
		// TODO Auto-generated method stub
		return "Consultar Saldo";
	}

	@Override
	public String ejecutar(Banco contexto) throws Exception {

		System.out.println("Consulta de saldo");
		System.out.println();
		
		// la clase Console no funciona bien en Eclipse
		Scanner console = new Scanner(System.in);			
		
		// Ingresa los datos
		System.out.println("Ingrese el número de cuenta");
		String numeroDeCuenta = console.nextLine();
		System.out.println("Ingrese la clave de la cuenta: ");
		String password = console.nextLine();
		
		Cuenta cuenta = contexto.buscarCuenta(numeroDeCuenta);
		if (cuenta == null) {
			throw new Exception("No existe cuenta con el número " + numeroDeCuenta);
		}
		
		if(!cuenta.getClave().equals(password)) {
			throw new Exception("Error");
		}
		
		System.out.println("Su saldo es: " + cuenta.getSaldo());
		return cuenta.getNumero();
	}

}
