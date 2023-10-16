import acreedor.*

class Banco inherits Acreedor{

    /* Punto 7 */
    override method accionDeTitularidadSobrePropiedad (unJugador, unaPropiedad){
        unJugador.comprar(unaPropiedad)
    }
}
