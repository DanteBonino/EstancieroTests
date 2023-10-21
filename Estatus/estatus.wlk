object libre {
	method valorDeCompra(unaPropiedad) = unaPropiedad.valorDeCompra()
}

object hipotecada {
	method valorDeCompra(unaPropiedad) = unaPropiedad.valorDeCompra() * 1.5
}

/* Se podria definir una clase status que tenga el método hipotecada valorDeCompra que sea
 * unaPropiedad.valorDeCompra * porcentaje
 * y que todos los estados se definan a partir de definir el porcentaje
 * pero van a surgir nuevos estatus? se justifica?
 * */
