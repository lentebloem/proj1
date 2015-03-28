class PokemonsController < ApplicationController
	
	def capture
		current = Pokemon.find(params[:id])
		current.update(trainer: current_trainer)
		redirect_to('/')		
	end

	def damage
		current = Pokemon.find(params[:pid])
		ph = current.health - 10
		current.update(health: ph)
		if current.health <= 0
			current.destroy
		end
		redirect_to('/trainers/'+ params[:trainer])
	end

end
