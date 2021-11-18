require 'pry'
class UsersController < ApplicationController

    #index route
    get '/users' do
        binding.pry
      users = User.all
      users.to_json(include: :games)

    end
  
    #show route
    get '/users/:id' do
        user = User.find_by(id: params[:id])
        if user
        user.to_json(include: :games)
        else
            "USER NOT FOUND (404 ERROR)"
        end
        end

    #create user
    post '/users' do
        user = User.create(
          name: params[:name],
          money: params[:money],
          wins: params[:wins],
          total_games: params[:total_games])
        user.to_json
      end

    #update user
    patch '/users/:id' do
        user = User.find_by(id: params[:id])
        user.update(name: params[:name], 
            money: params[:money], 
            wins: params[:wins], 
            total_games: params[:total_games])
        user.to_json
    end

    # delete user by id
    delete '/users/:id' do
        user = User.find_by(id: params[:id])
        user.destroy
    end

end
