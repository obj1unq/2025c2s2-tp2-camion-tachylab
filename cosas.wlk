object knightRider {
	//Atributos (Variables y Constantes)
	const peso = 500
	const nivelPeligrosidad = 10
	const bultos = 1
	//Metodos Lookers (Getters y Setters)
	method peso() {
		return peso
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method bultos() {
		return bultos
	}
}

object arenaGranel {
	//Atributos (Variables y Constantes)
	var peso = 200
	const nivelPeligrosidad = 2
	const bultos = 1
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method bultos() {
		return bultos
	}
	method peso(_peso) {
		peso = _peso
	}
}

object bumblebee {
	//Atributos (Variables y Constantes)
	const peso = 800
	const peligrosidadAuto = 15
	const peligrosidadRobot = 30
	const bultos = 2
	var estaTransformadoenRobot = false
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() {
		if (estaTransformadoenRobot) {
			return peligrosidadRobot
		} else {
			return peligrosidadAuto
		}
	}
	method bultos() {
		return bultos
	}
	method estaTransformadoenRobot(_estaTransformadoenRobot) {
		estaTransformadoenRobot = _estaTransformadoenRobot
	} 
}

object paqueteLadrillos {
	//Atributos (Variables y Constantes)
	var cantidadLadrillos = 100
	const pesoladrillo = 2
	const nivelPeligrosidad = 2
	const bultosHasta100Ladrillos = 1
	const bultosEntre101y300Ladrillos = 2
	const bultosMasDe300Ladrillos = 3
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return cantidadLadrillos * pesoladrillo 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method bultos() {
		if (cantidadLadrillos <= 100) {
			return bultosHasta100Ladrillos
		} else if (cantidadLadrillos <= 300) {
			return bultosEntre101y300Ladrillos
		} else {
			return bultosMasDe300Ladrillos
		}
	}
	method cantidadLadrillos(_cantidadLadrillos) {
		cantidadLadrillos = _cantidadLadrillos
	}
}

object bateriaAntiaerea {
	//Atributos (Variables y Constantes)
	var tieneMisilesCargados = true
	const pesoConMisiles = 300
	const pesoSinMisiles = 200
	const peligrosidadSinMisiles = 0
	const peligrosidadConMisiles = 100
	const bultosSinMisiles = 1
	const bultosConMisiles = 2
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		if (tieneMisilesCargados) {
			return pesoConMisiles
		} else {
			return pesoSinMisiles
			}
		}
	method nivelPeligrosidad() {
		if (tieneMisilesCargados) {
			return peligrosidadConMisiles
		} else {
			return peligrosidadSinMisiles
		}
	}
	method bultos() {
		if (tieneMisilesCargados) {
			return bultosConMisiles
		} else {
			return bultosSinMisiles
		}
	}
	method tieneMisilesCargados(_tieneMisilesCargados) {
		tieneMisilesCargados = _tieneMisilesCargados
	}
}

object residuosRadiactivos {
	//Atributos (Variables y Constantes)
	const nivelPeligrosidad = 200
	const bultos = 1
	var peso = 50
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method bultos() {
		return bultos
	}
	method peso(_peso) {
		peso = _peso
	}
}

//Más Cosas

object contenedorPortuario {
	//Atributos (Variables y Constantes)
	const property cosasCargadas = #{}
	const bultoBase = 1
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return 100 + cosasCargadas.sum({unaCosa => unaCosa.peso()}) 
	}
	method nivelPeligrosidad() {
		const nivelesPeligrosidadCosas = cosasCargadas.map({cosaCargada => cosaCargada.nivelPeligrosidad()})
		return nivelesPeligrosidadCosas.maxIfEmpty({0})
	}
	method bultos() {
		return bultoBase + cosasCargadas.sum({unaCosa => unaCosa.bultos()})
	}
}


object embalajeSeguridad {
	//Atributos (Variables y Constantes)
	var cosaEnvuelta = bumblebee
	const bultos = 2
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return cosaEnvuelta.peso()
	}
	method nivelPeligrosidad() { 
		return cosaEnvuelta.nivelPeligrosidad() / 2
	}
	method bultos() {
		return bultos
	}
	method cosaEnvuelta(_cosaEnvuelta) {
		cosaEnvuelta = _cosaEnvuelta
	}
}