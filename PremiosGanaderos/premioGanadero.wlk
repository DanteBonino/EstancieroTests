import casillero.*

class PremioGanadero inherits Casillero{
    override method cayo(unJugador){
        unJugador.cobrar(2500)
    }
}


class PremioGanaderoV2{
    method paso(_unJugador){
        //No pasa nada
    }
    method cayo(unJugador){
        unJugador.cobrar(2500)
    }
}