import exception.*
import acreedor.wlk

class Jugador inherits Acreedor{

	/* Punto 1 b */ 
	method pagarEstancia(costoDeConstruccionEstancia){
		self.pagarA(banco, costoDeConstruccionEstancia)
	}

	/* Punto 2b */
	method cantidadEmpresasPropias(){
		return propiedades.count{unaPropiedad => unaPropiedad.sosEmpresa()}
	}

	/* Punto 3 */
	method tirarDados(){
		return self.tirarUnDado() + self.tirarUnDado()
	}

	method tirarUnDado() = 1.randomUpTo(6).truncate(0)

	/* Punto 7 */
	override method accionDeTitularidadSobrePropiedad (unJugador, unaPropiedad){
		if(not self === unJugador){
			self.cobrarRentaA(unJugador, unaPropiedad)
		}
	}

	method cobrarRenta(otroJugador, unaPropiedad){
		const rentaAPagar = unaPropiedad.rentaPara(unJugador)
		otroJugador.pagarA(self, rentaAPagar)
	}

	method comprar(unaPropiedad){
		self.pagarA(banco, unaPropiedad.valorDeCompra())// Por ahora siempre se compra al banco, si no se puede hacer unaPropiedad.duenio()
		self.agregarPropiedad(unaPropiedad)
	}

	/* Metodos surgidos por tests */
	method agregarPropiedad(unaPropiedad){
		unaPropiedad.duenio(self)
		propiedades.add(unaPropiedad)
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