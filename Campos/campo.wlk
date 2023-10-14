class Campo{
    var duenio = banco
    var cantidadDeEstancias = 0

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
}