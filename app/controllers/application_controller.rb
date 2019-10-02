require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :hero_power
    end


    post '/teams' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
       members = params[:team][:members]
      params[:heroes].collect do |details|
        Superheroes.new(name: details[:name], power: details[:power], bio: detials[:bio])
      end
      @superheroes = Superheroes.all
      erb :team
    end
  end
