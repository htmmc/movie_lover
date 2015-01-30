
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
 	@movie_arr = []
 	search.movies.each do |film| 
 		if @movie_arr.length < 9 && film.poster != nil
 			puts @movie_arr.length
 			#@poster_arr << film.poster
 			@movie_arr << {:poster => film.poster, :year => film.year}
 		end 
 	end
 	if @movie_arr.length < 9
 		redirect to ('/sorry')
 	end 
	erb :posters
end

get '/sorry' do
	erb :sorry
end
