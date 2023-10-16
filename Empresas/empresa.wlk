import propiedad.*
import casillero.*

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
	
	 override method rentaPara(unJugador){
        return unJugador.tirarDados() * 30000 * duenio.cantidadEmpresasPropias() //Duda de si el jugador debe tirar los dados acá. Pasa que si no lo hace, no sé de dónde sacar el valor de los dados
    }
}