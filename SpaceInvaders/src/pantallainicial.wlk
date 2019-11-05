import wollok.game.*
import juego.*
import Level.*

object pantallaInicial {
	
	var property position = game.at(1,4)
	var property image = "res/PantallaPrincipal.PNG"	

	method cargar(){
		game.addVisual(self)	
	
		keyboard.enter().onPressDo {
			game.clear()
			game.addVisual(new Level("res/level1.png"))
			game.onTick(500, "comenzar",{ juego.comenzar() })			
		}
	}
}

