require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'
require_relative './models/url'

enable :sessions
after('/:id') do
	@url.increment!
end

get '/' do
	@new_url = URL.new
  @urls = URL.order("created_at DESC")
  erb :index
end

post '/' do
	@new_url = URL.new(url: params[:url])
	if @new_url.save
		redirect "/", :notice => 'Congrats! You got Shit.ly'
	else
	 @urls = URL.order("created_at DESC")
	 erb :index
	end
end

get '/:id' do
	@url = URL.find(params[:id])
	redirect @url.url
end
