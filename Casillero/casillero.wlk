class Casillero{
    method paso(_unJugador){
        /* No pasa nada */
    }

    method cayo(unJugador){
    	unJugador.cambiarPosicionActualPor(self)
    }
    
    method esCasilleroEspecial() = true
}

/*
En el Punto 7:
     -> Creo que toma más fuerza la idea de que sea una interfaz
*/