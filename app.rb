require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'
require_relative './models/url'

enable :sessions

get '/' do
	@new_url = URL.new
  @urls = URL.order("created_at DESC")
  erb :index
end

post '/' do
	url = URL.create(url: params[:url])
	if url.save
		redirect "/", :notice => 'Congrats! You got Shit.ly'
	else
		redirect "/", :error => 'Boo! Something went wrong. Try again.'
	end
	redirect '/'
end

get '/:id' do
	url = URL.find(params[:id]).url
	redirect url
end
