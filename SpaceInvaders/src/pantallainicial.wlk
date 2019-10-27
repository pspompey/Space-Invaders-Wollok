import wollok.game.*
import juego.*

object pantallaInicial {
	
	var property position = game.at(1,4)
	var property image = "res/PantallaPrincipal.PNG"	

	method cargar(){
		game.addVisual(self)	
	
		keyboard.enter().onPressDo {
			juego.comenzar()							
		}
	}
}

