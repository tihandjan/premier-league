class PlayersController < ApplicationController
    
    def index
        redirect_to root_path
    end

    def show
        @player = Player.find(params[:id])
    end
end