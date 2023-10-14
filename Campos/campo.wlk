import propiedad.*
import casillero.*

class Campo inherits Casillero{
    var property duenio = banco
    var cantidadDeEstancias = 0
    const provincia
    var valorDeRenta

    /* Punto 1 a */
    method duenio () = duenio

    /* Punto 1 b */
    method construirEstancia(){
        self.validarPosibilidadDeConstruccion()
        duenio.pagarEstancia(costoDeConstruccion)
        self.agregarNuevaEstancia()
    }

    method validarPosibilidadDeConstruccion(){
        provincia.puedeConstruirEstancia(self)
    }

    method agregarNuevaEstancia(){
        cantidadDeEstancias ++
    }

    method noTieneMasEstanciasQue(unaCantidad) = cantidadDeEstancias <= unaCantidad

    /* Punto 2a */
    method sosEmpresa() = false

    /* Metodos que surgieron por tests */
    method asignarProvincia(unaProvincia){
        //self.validarQueNoPertenezcaAOtraProvincia
        provincia = unaProvincia
    }

    /* Punto 4 */
    method rentaPara(_unJugador){
        return valorDeRenta * (2 ** cantidadDeEstancias)
    }

    /* Punto 7 */
    override method cayo(unJugador){
        duenio.accionDeTitularidadSobrePropiedad(unJugador, self)
    }
}

class CampoV2 inherits Propiedad{
    /* Todo igual pero sacas duenio pq ya lo hereda de Propiedad*/

    /* Punto 7 */
    //No se agrega el cayo acá pq lo heredan de Propiedad
}