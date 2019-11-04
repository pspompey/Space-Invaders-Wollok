import Nivel.*
import gameover.*
import invader.*
import wollok.game.*
import player.*

object juego {

	var property score = 0
	var property nivel = levelOne

	method eliminarEnemigo(enemigo){
		if(nivel.allInvaders().contains(enemigo)){
			game.sound("res/explosion.wav")
			score += enemigo.puntos()
			nivel.removeInvader(enemigo)
		}
		game.removeVisual(enemigo)
	}
	
	method validarFinal() {	
		game.onTick(0, "ganar",{ 
			if(nivel.allInvaders().isEmpty()){
				nivel.finalizar()			
			}
		})	

		game.onTick(0, "perder",{ 
			if(nivel.allInvaders().any({invader => invader.win()})){
				gameover.cargar()
			}
		})	
	}

	method validarDificultad() {
		game.onTick(500, "dificultad",{ 
			if(nivel.allInvaders().size() < 15){
				nivel.aumentarDificultad()
			}
		})	
	}
		
	method comenzar() {
		game.clear()
		game.addVisualCharacter(player)
		
		nivel.cargarEnemigos()
		nivel.cargarReglas()
		self.validarFinal()
		self.validarDificultad()
		
		game.onTick(0, "validar",{ player.validar() })
		game.onTick(0, "impactar",{ player.impactar() })

		game.onTick(0, "moverDisparo",{ player.moverDisparo() })
		game.onTick(0, "validarDisparo",{ player.validarDisparo()})

	
		keyboard.space().onPressDo { 
			player.disparar()
		}
	
		game.whenCollideDo(player, { invader => 
			game.sound("res/explosion.wav")
			gameover.cargar()
		})	

	}
	
	method restart() {
		score = 0
		nivel.restart()	
		nivel = levelOne
		self.comenzar()
	}
}

