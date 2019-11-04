import wollok.game.*
import player.*
import Level.*
import juego.*

object gameover {
	var property position = game.at(4,5)
	var property image = "res/gameover.png"
	
	method cargar(){
		game.clear()
		game.addVisual(self)	
		game.addVisual(player)
		game.onTick(0, "puntuación",{
			game.say(player, "Tu puntuación es: " + juego.score().toString())
		})
		
		keyboard.r().onPressDo {
			game.clear()
			game.addVisual(new Level("res/level1.png"))
			game.onTick(500, "comenzar",{ 
				juego.restart()
			})			
		}
		
		keyboard.f().onPressDo {			
			game.stop()	
		}
	}
}

