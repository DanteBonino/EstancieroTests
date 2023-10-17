import propiedad.*
import casillero.*
import excepciones.*

class Empresa inherits Casillero{
    var property duenio

    /* Punto 2a */
    method sosEmpresa() = true

    /* Punto 4 */
    method rentaPara(unJugador){
        return unJugador.tirarDados() * 30000 * duenio.cantidadEmpresasPropias() //Duda de si el jugador debe tirar los dados acá. Pasa que si no lo hace, no sé de dónde sacar el valor de los dados
    }

    /* Punto 7 */
    override method cayo(unJugador){
        duenio.accionDeTitularidadSobrePropiedad(unJugador, self)
    }
}

class EmpresaV2 inherits Propiedad{
	override method sosEmpresa() = true
	
	/* Punto 4 */
	 override method rentaPara(unJugador){
        return unJugador.tirarDados() * 30000 * duenio.cantidadEmpresasPropias() //Duda de si el jugador debe tirar los dados acá. Pasa que si no lo hace, no sé de dónde sacar el valor de los dados
    }
    
    /* Punto 2 Parte 2 */
    method validarSiLaCompraElGarca(unJugador){
    	if(!juego.algunOtroJugadorTieneAlgunaEmpresa(unJugador)) throw ningunOtroJugadorTieneUnaEmpresa
    }
    
    method validarSiLaCompraElImperialista(unJugador){
    	if(! juego.ningunJugadorTieneEmpresa()) throw lasEmpresasNoSonUnMonopolioDelBanco
    }
    
    /* Punto 2 Parte 2 Versio 2 */
    method validarSiLaCompra(unJugador, unEstilo){
    	unEstilo.validarSiLaEmpresaCumpleLosRequisitos(unJugador, self.juego())
    }
    
}