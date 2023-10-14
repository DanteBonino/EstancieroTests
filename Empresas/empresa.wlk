import propiedad.*
import casillero.*

class Empresa inherits Casilleros{
    var property duenio = banco

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
    /* Todo igual pero se saca al duenio pq lo hereda de propiedad */

    /* Punto 7 */
    //No se agrega el cayo acá pq lo heredan de Propiedad
}