public aspect SaldoReducido {
	
	pointcut saldoReducido() : call ( * saldoDespuesDeRetirar*(..));
	
	pointcut saldoReducidoTransferencia() : call ( * saldoDespuesDeTransferir*(..));
	
	after() returning(long saldo): saldoReducido() {
		System.out.println("Saldo reducido: "+ saldo);
		if(saldo<200000) {
			throw new RuntimeException("Saldo reducido activado, no puede tener menos de 200.000 en la cuenta");
		}	
	}
	
	after() returning(long saldo): saldoReducidoTransferencia() {
		System.out.println("Saldo reducido: "+ saldo);
		if(saldo<200000) {
			throw new RuntimeException("Saldo reducido activado, no puede tener menos de 200.000 en la cuenta");
		}	
	}
}