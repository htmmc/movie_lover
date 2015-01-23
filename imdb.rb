
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
 	movies_arr = search.movies.take(9)
 	@posters = movies_arr.each {|film| puts film.poster }
	 erb :posters
end
 