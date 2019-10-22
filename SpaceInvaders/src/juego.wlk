import gamewin.*
import invader.*
import wollok.game.*

object juego {

	var invaders1 = [
		new Invader1 (game.at(2,11), "res/invader1.gif"), 
		new Invader1 (game.at(3,11), "res/invader1.gif"), 
		new Invader1 (game.at(4,11), "res/invader1.gif"), 
		new Invader1 (game.at(5,11), "res/invader1.gif"),
		new Invader1 (game.at(6,11), "res/invader1.gif"),
		new Invader1 (game.at(7,11), "res/invader1.gif"),
		new Invader1 (game.at(8,11), "res/invader1.gif"),
		new Invader1 (game.at(9,11), "res/invader1.gif"),
		new Invader1 (game.at(10,11), "res/invader1.gif"),
		new Invader1 (game.at(11,11), "res/invader1.gif")
	]
	
	var invaders2 = [
		new Invader2 (game.at(2,12), "res/invader3.gif"), 
		new Invader2 (game.at(3,12), "res/invader3.gif"), 
		new Invader2 (game.at(4,12), "res/invader3.gif"), 
		new Invader2 (game.at(5,12), "res/invader3.gif"),
		new Invader2 (game.at(6,12), "res/invader3.gif"),
		new Invader2 (game.at(7,12), "res/invader3.gif"),
		new Invader2 (game.at(8,12), "res/invader3.gif"),
		new Invader2 (game.at(9,12), "res/invader3.gif"),
		new Invader2 (game.at(10,12), "res/invader3.gif"),
		new Invader2 (game.at(11,12), "res/invader3.gif")
	]
	
	var invaders3 = [
		new Invader3 (game.at(2,13), "res/ufo0.gif"), 
		new Invader3 (game.at(3,13), "res/ufo0.gif"), 
		new Invader3 (game.at(4,13), "res/ufo0.gif"), 
		new Invader3 (game.at(5,13), "res/ufo0.gif"),
		new Invader3 (game.at(6,13), "res/ufo0.gif"),
		new Invader3 (game.at(7,13), "res/ufo0.gif"),
		new Invader3 (game.at(8,13), "res/ufo0.gif"),
		new Invader3 (game.at(9,13), "res/ufo0.gif"),
		new Invader3 (game.at(10,13), "res/ufo0.gif"),
		new Invader3 (game.at(11,13), "res/ufo0.gif")
	]

	method cargarEnemigos() {
			
		invaders1.forEach { invader => game.addVisual(invader) }
		invaders1.forEach { invader => 
			game.onTick(2000, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
		}
		
		invaders2.forEach { invader => game.addVisual(invader) }
		invaders2.forEach { invader => 
			game.onTick(2000, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
		}
		
		invaders3.forEach { invader => game.addVisual(invader) }
		invaders3.forEach { invader => 
			game.onTick(2000, "movimiento",{ invader.mover() })
			game.onTick(500, "movimiento",{ invader.moverDisparo() })
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
		game.onTick(500, "ganar",{ 
			if(invaders1.isEmpty() && invaders2.isEmpty() && invaders3.isEmpty()){
				game.clear()
				game.addVisual(gamewin)
			}
		})	
	}
}

