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
	//Metodos funcionales
	method efectoAccidente() {}
}

object arenaGranel {
	//Atributos (Variables y Constantes)
	var peso = 200
	const nivelPeligrosidad = 2
	const bultos = 1
	const extraAccidente = 20
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
	//Metodos funcionales
	method efectoAccidente() {
		peso += extraAccidente
	}
}

object bumblebee {
	//Atributos (Variables y Constantes)
	const peso = 800
	const bultos = 2
	var transformacion = auto
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() {
		return transformacion.nivelPeligrosidad()
	}
	method bultos() {
		return bultos
	}
	method transformacion() {
		return transformacion
	}
	method transformacion(_transformacion) {
		transformacion = _transformacion
	}
	//Metodos funcionales
	method efectoAccidente() {
		transformacion = transformacion.cambiarModo()
	} 
}

object auto {
	//Atributos (Variables y Constantes)
	const nivelPeligrosidad = 15
	//Metodos Lookers (Getters y Setters)
	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}
	method cambiarModo() {
		return robot
	}
}

object robot {
	//Atributos (Variables y Constantes)
	const nivelPeligrosidad = 30
	//Metodos Lookers (Getters y Setters)
	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}
	method cambiarModo() {
		return auto
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
	method cantidadLadrillos() {
		return cantidadLadrillos
	}
	method cantidadLadrillos(_cantidadLadrillos) {
		cantidadLadrillos = _cantidadLadrillos
	}
	//Metodos funcionales
	method efectoAccidente() {
		cantidadLadrillos = 0.max(cantidadLadrillos - 12)
	}
}

object bateriaAntiaerea {
	//Atributos (Variables y Constantes)
	var estadoMisilesActual = misilesCargados
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return estadoMisilesActual.peso()
	}
	method nivelPeligrosidad() {
		return estadoMisilesActual.nivelPeligrosidad()
	}
	method bultos() {
		return estadoMisilesActual.bultos()
	}
	method estadoMisilesActual() {
		return estadoMisilesActual
	}
	method estadoMisilesActual(_estadoMisilesActual) {
		estadoMisilesActual = _estadoMisilesActual
	}
	//Metodos funcionales
	method efectoAccidente() {
		estadoMisilesActual = misilesDescargados
	}
}

object misilesCargados {
	//Atributos (Variables y Constantes)
	const peso = 300
	const nivelPeligrosidad = 100
	const bultos = 2
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

object misilesDescargados {
	//Atributos (Variables y Constantes)
	const peso = 200
	const nivelPeligrosidad = 0
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

object residuosRadiactivos {
	//Atributos (Variables y Constantes)
	const nivelPeligrosidad = 200
	const bultos = 1
	const extraAccidente = 15
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
	//Metodos funcionales
	method efectoAccidente() {
		peso += extraAccidente
	}
}

//Más Cosas

object contenedorPortuario {
	//Atributos (Variables y Constantes)
	const property cosasCargadas = #{}
	const bultoBase = 1
	const pesoBase = 100
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return pesoBase + cosasCargadas.sum({unaCosa => unaCosa.peso()}) 
	}
	method nivelPeligrosidad() {
		const nivelesPeligrosidadCosas = cosasCargadas.map({cosaCargada => cosaCargada.nivelPeligrosidad()})
		return nivelesPeligrosidadCosas.maxIfEmpty({0})
	}
	method bultos() {
		return bultoBase + cosasCargadas.sum({unaCosa => unaCosa.bultos()})
	}
	//Metodos de validaciones y condiciones
	method puedeCargar(unaCosa) {
		return not cosasCargadas.contains(unaCosa)
	}
	method puedeDescargar(unaCosa) {
		return cosasCargadas.contains(unaCosa)
	}
	method validarDescargar(unaCosa) {
		if (not self.puedeDescargar(unaCosa)) {
			self.error(unaCosa + " no está cargada en el contenedor")
		}
	}
	method validarCargar(unaCosa) {
		if (not self.puedeCargar(unaCosa)) {
			self.error(unaCosa + " ya está cargada en el contenedor")
		}
	}
	//Metodos Funcionales
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosasCargadas.add(unaCosa)
	}
	method descargar(unaCosa) {
		self.validarDescargar(unaCosa)
		cosasCargadas.remove(unaCosa)
	}
	//Metodos funcionales
	method efectoAccidente() {
		cosasCargadas.forEach({cosaCargada => cosaCargada.efectoAccidente()})
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
	//Metodos funcionales
	method efectoAccidente() {}
}