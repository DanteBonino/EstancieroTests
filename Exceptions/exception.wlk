/* Punto 1b */
const noEsMonopolioLaProvincia = new Exception (message = "La provincia a la que pertenece el campo no es un monopolio, por ende no se puede construir una nueva estancia")
const noEsConstruccionPareja   = new Exception (message = "No todos los campos tienen menos o la misma cantidad de estancias que el campo donde se quiere construir, por ende no se puede construir una nueva estancia")

const noPuedeRealizarElPago    = new Exception (message = "El acreedor no puede realizar el pago correspondiente debido a que su saldo es insuficiente")