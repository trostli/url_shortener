require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require_relative './models/url'

get '/' do
	@new_url = URL.new
  @urls = URL.order("created_at DESC")
  erb :index
end

post '/' do
	URL.create(url: params[:url])
	redirect '/'
end

get '/:id' do
	url = URL.find(params[:id]).url
	redirect url
end
