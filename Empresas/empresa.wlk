class Empresa{
    var property duenio = banco

    /* Punto 2a */
    method sosEmpresa() = true

    /* Punto 4 */
    method rentaPara(unJugador){
        return unJugador.tirarDados() * 30000 * duenio.cantidadEmpresasPropias() //Duda de si el jugador debe tirar los dados acá. Pasa que si no lo hace, no sé de dónde sacar el valor de los dados
    }
}