
require 'imdb'
require 'awesome_print'
require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?

enable :sessions

get '/' do
	erb :movies
end

post '/movies' do
	session[:moviename] = params[:moviename]
	puts 'MOVIEEEEEE NAMEEEEEEE is ' + session[:moviename]
	redirect to('/posters')
end 

get '/posters' do
	p "THIS IS PASSING! ", session[:moviename]
	search = Imdb::Search.new(session[:moviename])
 	nine_movies = search.movies.take(9)
 	@poster_url = nine_movies.each {|film| puts film.poster }
	 erb :posters
end
 