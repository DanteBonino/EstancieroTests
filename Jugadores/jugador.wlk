import exception.*
class Jugador{
	/* Punto 1 b */ 
	method pagarEstancia(costoDeConstruccionEstancia){
		self.pagarA(banco, costoDeConstruccionEstancia)
	}

	method pagarA(unAcreedor, unMonto){
		self.validarPosibilidadDePagar(unMonto)
		self.pagar(unMonto)
		unAcreedor.cobrar(unMonto)
	}

	method validarPosibilidadDePagar(unMonto){
		if(unMonto > dinero) throw noPuedeRealizarElPago
	}

	method pagar(unMonto){
		dinero -= unMonto
	}
}


/*
    var property posicionActual = salida
	var turnosRestantesPreso    = 0
    method tirarDados() {
		try {
    		return self.tirarDadosUnaVez()
  		}
  		catch primerTiroException : SacoDoblesException {
    		try {
      			return self.tirarDadosUnaVez() + primerTiroException.valorDelTiro()
    		}
    		catch segundoTiroException : SacoDoblesException {
      			throw new VaPresoException()
    		}
  		}
	}
	
	method tirarDadosUnaVez() {
  		const dado1 = self.tirarUnDado()
  		const dado2 = self.tirarUnDado()
  		
		if (dado1 == dado2){
			self.dejarDeEstarPreso()
			throw new SacoDoblesException(valorDelTiro = dado1 + dado2)
		}
		return dado1 + dado2
		}
	
	method tirarUnDado(){//Unico
		return 1.randomUpTo(6).truncate(0)
	}
	
	method dejarDeEstarPreso(){
		turnosRestantesPreso = 0
	}

    method moverseSobre(unosCasilleros){
		if(not self.estaPreso()){
			unosCasilleros.forEach{unCasillero => unCasillero.paso(self)}
			const ultimoCasillero = unosCasilleros.last()
			ultimoCasillero.cayo(self)
		}
		else self.perderTurno()
		
	}
	
	method esSuPosicionActual(unCasillero){
		return self.posicionActual() === unCasillero
	}
	
	method irPreso(){
		turnosRestantesPreso = 3
		self.posicionActual(prision)
	}

    method turnosRestantesPreso() = turnosRestantesPreso
	
	method estaPreso()= self.esSuPosicionActual(prision) and self.turnosRestantesPreso() > 0
	
	method perderTurno(){
		turnosRestantesPreso --
	}


*/