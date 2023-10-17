import acreedor.*

class Banco inherits Acreedor{

    /* Punto 7 */
    override method accionDeTitularidadSobrePropiedad (unJugador, unaPropiedad){
        unJugador.comprarV2(unaPropiedad)
    }
    
    /* Punto 2 Parte 2 */
    override method esJugador () = false
}
