class banco inherits Acreedor{
    var dinero //Comun con Jugador

    /* Punto 1b */
    method cobrar(unMonto){
        dinero += unMonto
    }
}