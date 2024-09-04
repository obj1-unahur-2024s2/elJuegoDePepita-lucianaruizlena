import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)
	var property seguidor = silvestre

	/* property es básicamente esto: 
	
	method seguidor() = seguidor
	method seguidor(unSeguidor) {
		seguidor = unSeguidor
	} */

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		seguidor.position(game.at(position.x(), seguidor.position().y())) 
		//game.at(x,y) me da una nueva posición.
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return self.position() == nido.position()
		// si esto da verdadero, la imagen de Pepita es grande. Sino, queda chica.
	}

}

