object camion {
	//Atributos (Variables y Constantes)
	const property cosas = #{}
	//Metodos Lookers (Getters y Setters)
	//Metodos de validacion y sus condiciones
	method puedeCargar(unaCosa) {
		return not cosas.contains(unaCosa)
	}
	method puedeDescargar(unaCosa) {
		return cosas.contains(unaCosa)
	}
	method esParElPeso(unaCosa) {
		return (unaCosa.peso() % 2) == 0
	}
	method validarDescargar(unaCosa) {
		if (not self.puedeDescargar(unaCosa)) {
			self.error(unaCosa + " no está cargada en el camión")
		}
	}
	method validarCargar(unaCosa) {
		if (not self.puedeCargar(unaCosa)) {
			self.error(unaCosa + " ya está cargada en el camión")
		}
	}
	//Metodos funcionales
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		self.validarDescargar(unaCosa)
		cosas.remove(unaCosa)
	}
	method esTodoPesoPar() {
		return cosas.all({unaCosa => self.esParElPeso(unaCosa)})
	}
}
