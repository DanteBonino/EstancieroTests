import excepciones.*

class Acreedor{
    const property propiedades = new Set()
    var dinero 		           = 0


	/* Punto 5 */
    method pagarA(unAcreedor, unMonto){//Un Acreedor puede ser un jugador o un banco, por ende ambos deben poder validar si pueden pagar algo, pagar algo y cobrar algo
		self.validarPosibilidadDePagar(unMonto)
		self.pagar(unMonto)
		unAcreedor.cobrar(unMonto)
	}

    method cobrar(unMonto){/* Surge por primera vez en el punto 1a en Banco */
        self.modificarDinero(unMonto)
    }
  
    method pagar(unMonto){/* Surge por primera vez en el punto 1a en Jugador */
        self.modificarDinero(-unMonto)
    }

    method modificarDinero(unMonto){
        dinero += unMonto
    }

    method validarPosibilidadDePagar(unMonto){
		if(unMonto > dinero) throw new NoPuedeRealizarElPago()
	}
	
	/* Punto 7 (no justificaría herencia por si sola pq no se comparte implementación) */
    method accionDeTitularidadSobrePropiedad(unJugador, unaPropiedad)//La usan el banco y los jugadores, pero no comparten implemetanción
	
	method esUnJugadorDistintoA(unJugador){
		return self.esJugador() and self !== unJugador
	}
	
	method esJugador()
	
    /* Métodos que surgieron por tests */
    method tienePropiedad(unaPropiedad) = propiedades.contains(unaPropiedad) //and unaPropiedad.duenio() === self //Los dos o uno?
    
    method agregarPropiedad(unaPropiedad){//Se lo pasó acá por setearPropiedadesParaEmpezar de Juegi
		unaPropiedad.cambiarDuenio(self)
		propiedades.add(unaPropiedad)
	}
	
	method eliminarPropiedad(unaPropiedad){
		if(self.tienePropiedad(unaPropiedad)) propiedades.remove(unaPropiedad)
	}
	
	method dinero () = dinero
}