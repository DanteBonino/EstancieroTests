class Casillero{
	/* Punto 6 (aunque todavía sería una interfaz) */
    method paso(_unJugador){
        /* No pasa nada */
    }
	
	/* Punto 7 (seguiría siendo una interfaz pq no se comparte implementación */
    method cayo(unJugador){
    	unJugador.cambiarPosicionActualPor(self)//Recién en el punto 8 surge la idea de que en cualquier casillero cuando se cae, se actualiza la posición del jugador
    }
    
    method esCasilleroEspecial() = true /* No se usa, se podría usar si no se quiere poner sosEmpresa en Casillero */
    
    method sosEmpresa() = false /* Surge en 2a, se paso acá para no filtrar dos veces en el tablero. Puede cambiar */
    
    method esEmpresaYNoEsEsta(unaEmpresa){
    	return self.sosEmpresa() and self !== unaEmpresa
    } 
}

/*
En el Punto 7:
     -> Creo que toma más fuerza la idea de que sea una interfaz
*/