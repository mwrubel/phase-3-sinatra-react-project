class GamesController < ApplicationController
  
    #index route
    get "/games" do
        games = Game.all
        games.to_json
    end

    #post game to specific user (that played the game)
    post "games/:user_id/games" do
        user = User.find_by(id: params[:user_id])
        game = user.games.create(params)
        game.to_json
    end
  
  end