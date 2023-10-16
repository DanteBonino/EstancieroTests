import propiedad.*
import casillero.*

class Campo inherits Casillero{
    var property duenio 
    var cantidadDeEstancias = 0
    var provincia
    var valorDeRenta
    var costoDeConstruccion

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
    var cantidadDeEstancias = 0
    var provincia
    var valorDeRenta
    var costoDeConstruccion


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
    
    method cantidadDeEstancias() = cantidadDeEstancias

    method noTieneMasEstanciasQue(unaCantidad) = cantidadDeEstancias <= unaCantidad

    /* Punto 2a */
    override method sosEmpresa() = false

    /* Metodos que surgieron por tests */
    method asignarProvincia(unaProvincia){
        //self.validarQueNoPertenezcaAOtraProvincia
        provincia = unaProvincia
    }

    /* Punto 4 */
    override method rentaPara(_unJugador){
        return valorDeRenta * (2 ** cantidadDeEstancias)
    }
}