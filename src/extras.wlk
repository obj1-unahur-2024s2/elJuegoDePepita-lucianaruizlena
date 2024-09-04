import pepita.*
import comidas.*
import wollok.game.*

object nido {
	method image() = "nido.png"
	method position() = game.at(game.width() -2, game.height()-1)
	// para que esté en el margen superior derecho.
}

object silvestre {
	var property position = game.origin()  
	method image() = "silvestre.png"
	// para que esté en la posición inicial (0,0).
	method siguiente() = manzana
}

