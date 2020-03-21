import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

import ejemplo.cajero.modelo.Transaccion;

public aspect Auditoria {
	// TODO Auto-generated aspect
pointcut auditoria() : call ( * getTransaccionesDiarias());
	
	after() returning(ArrayList<Transaccion> resultado): auditoria() {
		
		List<String> resultados = resultado.stream().map(s->s.toString()).collect(Collectors.toList());
		
		Path path = Paths.get("auditoria.txt");
		try {
			if(!Files.exists(path))
				Files.createFile(path);
			Files.write(path, resultados, StandardOpenOption.APPEND);
		}catch (IOException e1) {
				e1.printStackTrace();
		}
		
	}
}