require 'sinatra'
require 'sinatra/activerecord'
require_relative '../config/environments'
require_relative '../models/url'

get '/' do
  "hello world"
end
