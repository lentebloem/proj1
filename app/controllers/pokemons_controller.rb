class PokemonsController < ApplicationController

  before_filter :authenticate_trainer!

	def capture
		current = Pokemon.find(params[:id])
		current.trainer = this
	end
end
