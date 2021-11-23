require 'pry'
class GamesController < ApplicationController
  
    #index route
    get "/games" do
        games = Game.all
        games.to_json
    end

    #post game to specific user (that played the game)
     post "/users/:user_id/games" do
        user = User.find_by(id: params[:user_id])
        if (params[:won_game])
            user.update(money: user.money+5)
        else
            user.update(money: user.money-5)
        end
        game = user.games.create(params)
        game.to_json
    
end
  
  end