require 'imdb'
require 'awesome_print'
require 'sinatra'
require 'pry'

get '/' do
	erb :movies
end

post '/movies' do
	movie[:movie_name] = params[:movie_name]
	redirect to('/posters')
end 

get '/posters' do
	erb :posters
end 


#search = Imdb::Search.new(#movie[:movie_name])
#movie returns as an array
#ap search.movies[0].poster
#ap search.movies.size
#posters = method to call poster 


