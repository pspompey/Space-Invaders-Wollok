import invader.*
import gameover.*
import wollok.game.*
import juego.*
import Level.*


class Nivel{
	
	var property dificultad
	var property invaders1 = []
	var property invaders2 = []
	var property invaders3 = []

	method cargarEnemigos() {
		
		self.allInvaders().forEach { 
			invader => game.addVisual(invader) 
			game.onTick(dificultad, "mover",{ invader.mover() })
			game.onTick(500, "moverDisparo",{ invader.moverDisparo() })
			game.onTick(500, "validarDisparo",{ invader.validarDisparo() })
		}	
		
	}
	
	method aumentarDificultad()
	
	
	method allInvaders() = invaders1+invaders2+invaders3

	method restart(){
		invaders1 = []
		invaders2 = []
		invaders3 = []		
	}
	
	method removeInvader(enemigo) {
			invaders1.remove(enemigo)
			invaders2.remove(enemigo)
			invaders3.remove(enemigo)
	}
	
	method cargarReglas() {
		
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
	
	method finalizar()
}

object levelOne inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 8000
		
		10.times({i => 
			invaders1.add(new Invader1 (game.at(i+1,10), "res/invader1.gif"))
			invaders2.add(new Invader2 (game.at(i+1,11), "res/invader3.gif"))
			invaders3.add(new Invader3 (game.at(i+1,12), "res/ufo0.gif"))
		})
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 2000
	}
	
	override method finalizar(){
		game.clear()
		game.addVisual(new Level("res/level2.png"))
		game.onTick(500, "comenzar",{ 
			juego.nivel(levelTwo)			
			juego.comenzar()
		})	
	}
	

}

object levelTwo inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 2000
		
		6.times({i => 
			invaders1.add(new Invader1 (game.at(i+3,7), "res/invader1.gif"))
			invaders2.add(new Invader2 (game.at(i+3,8), "res/invader3.gif"))
			invaders3.add(new Invader3 (game.at(i+3,9), "res/ufo0.gif"))
		})
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 1000
	}
		
	override method finalizar(){
		game.clear()
		game.addVisual(new Level("res/level3.png"))
		game.onTick(500, "comenzar",{ 
			juego.nivel(levelThree)			
			juego.comenzar()
		})	
	}	

}

object levelThree inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 10000
		
		4.times({i => 
			invaders1.add(new Invader1 (game.at(1,13-i), "res/invader1.gif"))
			invaders1.add(new Invader1 (game.at(3,13-i), "res/invader1.gif"))
		})
		invaders1.add(new Invader1 (game.at(2,9), "res/invader1.gif"))
		
		3.times({i => 
			invaders2.add(new Invader2 (game.at(i+4,12), "res/invader3.gif"))
			invaders2.add(new Invader2 (game.at(6,12-i), "res/invader3.gif"))
		})
		
		4.times({i => 
			invaders3.add(new Invader3 (game.at(9,13-i), "res/ufo0.gif"))
			invaders3.add(new Invader3 (game.at(12,13-i), "res/ufo0.gif"))
		})
		invaders3.add(new Invader3 (game.at(10,11), "res/ufo0.gif"))
		invaders3.add(new Invader3 (game.at(11,10), "res/ufo0.gif"))
		
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 6000
	}
	
	override method finalizar(){
		gameover.cargar()
	}	

}

