class PokemonsController < ApplicationController
	def capture
		Pokemon.find(params[:id]).update(trainer: current_trainer)
		redirect_to('/')		
	end
end
