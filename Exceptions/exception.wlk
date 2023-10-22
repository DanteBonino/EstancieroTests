/* Punto 1b */
const noEsMonopolioLaProvincia = new Exception (message = "La provincia a la que pertenece el campo no es un monopolio, por ende no se puede construir una nueva estancia")
const noEsConstruccionPareja   = new Exception (message = "No todos los campos tienen menos o la misma cantidad de estancias que el campo donde se quiere construir, por ende no se puede construir una nueva estancia")

const noPuedeRealizarElPago    = new Exception (message = "El acreedor no puede realizar el pago correspondiente debido a que su saldo es insuficiente")

class NoPuedeRealizarElPago inherits wollok.lang.Exception{
	override method message () = "El acreedor no puede realizar el pago correspondiente debido a que su saldo es insuficiente"
}

class SacoDoblesException inherits ExcepcionesDeEstadoDelJugador {
	const property valorDelTiro
}

class VaPreso inherits ExcepcionesDeEstadoDelJugador{
	
}

class EsLibre inherits ExcepcionesDeEstadoDelJugador{
	
}

class ExcepcionesDeEstadoDelJugador inherits wollok.lang.Exception{/* Se creó para catchear en Preso a las dos excepcione por igual */
	
}

/* Punto 2 Parte 2 */
const ningunOtroJuegadorTieneUnCampoEnLaProvincia = new Exception (message = "Ningun otro jugador tiene campos en la provincia del mismo")
const elImperialistaNoCompraLaPropiedad           = new Exception (message = "La propiedad no cumple las condiciones adecuadas para ser comprada por el jugador")
const ningunOtroJugadorTieneUnaEmpresa            = new Exception (message = "No hay ningún otro jugador que sea dueño de alguna empresa, por ende no compra la empresa")
const lasEmpresasNoSonUnMonopolioDelBanco         = new Exception (message = "Las empresas no son todas del banco, por ende no compra la empresa")

/* Punto 3 Parte 2 */
class NoPuedeHipotecarMasPropiedades inherits wollok.lang.Exception{
	override method message () = "El jugador no puede hipotecar mas propiedades para intentar pagar el monto requerido"
}

class Perdio inherits wollok.lang.Exception{
	override method message () = "El jugador perdió"
}