require 'sinatra'
require 'sinatra/activerecord'
require_relative '../config/environments.rb'
require_relative '../models/model.rb'

get '/' do
  "hello world"
end
