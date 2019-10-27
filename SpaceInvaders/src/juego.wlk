import gameover.*
import invader.*
import wollok.game.*
import player.*
import gameover.*

object juego {

	var dificultad = 5000	
	var invaders1 = []
	var invaders2 = []
	var invaders3 = []

	method cargarEnemigos() {
		10.times({i => 
			invaders1.add(new Invader1 (game.at(i+1,10), "res/invader1.gif"))
			invaders2.add(new Invader2 (game.at(i+1,11), "res/invader3.gif"))
			invaders3.add(new Invader3 (game.at(i+1,12), "res/ufo0.gif"))
		})
		
		invaders1.forEach { 
			invader => game.addVisual(invader) 
			game.onTick(dificultad, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
			game.onTick(500, "movimiento",{ invader.validarDisparo() })
		}
		
		invaders2.forEach { 
			invader => game.addVisual(invader) 
			game.onTick(dificultad, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
			game.onTick(500, "movimiento",{ invader.validarDisparo() })
		}
		
		invaders3.forEach { invader => game.addVisual(invader)
			game.onTick(dificultad, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
			game.onTick(500, "movimiento",{ invader.validarDisparo() })
		}
		
		
		game.onTick(7000, "disparar",{ 
			if(!invaders1.isEmpty()){
				invaders1.get(0.randomUpTo(invaders1.size()-1))
				.disparar()
			}
		})
		
		game.onTick(5000, "disparar",{ 
			if(!invaders2.isEmpty()){
				invaders2.get(0.randomUpTo(invaders2.size()-1))
				.disparar()
			}
		})
		
		game.onTick(2500, "disparar",{ 
			if(!invaders3.isEmpty()){
				invaders3.get(0.randomUpTo(invaders3.size()-1))
				.disparar()
			}
		})
		
	}
	
	method eliminarEnemigo(enemigo){
		if(invaders1.contains(enemigo)){
			invaders1.remove(enemigo)
		}else{
			if(invaders2.contains(enemigo)){
				invaders2.remove(enemigo)
			}else{
				invaders3.remove(enemigo)
			}	
		}
		game.removeVisual(enemigo)
	}
	
	method validarFinal() {
		game.onTick(0, "ganar",{ 
			if((invaders1+invaders2+invaders3).isEmpty()){
				game.clear()
				game.addVisual(gameover)
			}
		})	
		
		game.onTick(0, "perder",{ 
			if((invaders1+invaders2+invaders3).any({invader => invader.win()})){
				game.clear()
				game.addVisual(gameover)
			}
		})
	}

	method validarDificultad() {
		game.onTick(500, "dificultad",{ 
			if((invaders1)+(invaders2)+(invaders3).size() < 15){
				dificultad = 50
			}
		})	
	}
		
	method comenzar() {
		game.clear()
		game.addVisualCharacter(player)
		self.cargarEnemigos()
		self.validarFinal()

		game.onTick(0, "movimiento",{ player.validar() })
		game.onTick(0, "impacto",{ player.impactar() })

		game.onTick(0, "movimiento",{ player.moverDisparo() })
		game.onTick(0, "movimiento",{ player.validarDisparo()})

	
		keyboard.space().onPressDo { player.disparar()}
	
		game.whenCollideDo(player, { invader => 
			game.clear()
			game.addVisual(gameover)
		})	

	}
}

