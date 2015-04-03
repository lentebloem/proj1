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

    def new
        @pokemon = Pokemon.new()
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.health = 100
        @pokemon.level = 1
        @pokemon.trainer_id = current_trainer.id
        if @pokemon.save
        	redirect_to current_trainer
        else
            flash[:error] = @pokemon.errors.full_messages.to_sentence
            render "new"
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name)
	end

end
