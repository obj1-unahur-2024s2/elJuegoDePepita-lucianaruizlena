import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		// se pone "pepita." y no solo "irA(nuevaPosicion)" o "position()" porque estamos en "niveles.wlk", por lo que hay que llamar al objeto "pepita".
		keyboard.m().onPressDo({self.cambiarSeguidor()}) // presionando m, cambiamos el seguidor.
	}

	method cambiarSeguidor() {
		const seguidorActual = pepita.seguidor()
		const seguidorSiguiente = seguidorActual.siguiente()

		manzana.position(seguidorActual.position()) //cambia la posición de la manzana a la posición que tenía el anterior seguidor de pepita. 
		game.removeVisual(seguidorActual) //game.removeVisual(visual) sirve para remover un objeto del tablero.
		game.addVisual(seguidorSiguiente) // este es para agregar algo en el tablero.
		pepita.seguidor(seguidorSiguiente)
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

