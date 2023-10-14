class Acreedor{
    const propiedades = new Set()
    var dinero = 0

    method pagarA(unAcreedor, unMonto){//Un Acreedor puede ser un jugador o un banco, por ende ambos deben poder validar si pueden pagar algo, pagar algo y cobrar algo
		self.validarPosibilidadDePagar(unMonto)
		self.pagar(unMonto)
		unAcreedor.cobrar(unMonto)
	}

    method cobrar(unMonto){
        self.modificarDinero(unMonto)
    }
  
    method pagar(unMonto){
        modificarDinero(-unMonto)
    }

    method modificarDinero(unMonto){
        dinero += unMonto
    }

    method validarPosibilidadDePagar(unMonto){
		if(unMonto > dinero) throw noPuedeRealizarElPago
	}

    method accionDeTitularidadSobrePropiedad(unJugador, unaPropiedad)//La usan el banco y los jugadores, pero no comparten implemetanción

    /* Métodos que surgieron por tests */
    method tienePropiedad(unaPropiedad) = propiedades.contains(unaPropiedad) and unaPropiedad.duenio() === self //Los dos o uno?
}