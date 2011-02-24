# TODO:
#   ensure settings are only loading once
#   README
#   google charts
#   gitignore
#   embeded as rack app
#   http_simple auth

require 'rubygems'
require 'sinatra'
require 'aws/ses'
require 'erb'
require 'ses_change_initializer'

before do
  @app_name = "Stephen's Account"
  @ses ||= SesChangeInitializer.ses_account
end

get '/' do
  erb :index
end

get '/delivery_attempts' do
  erb :delivery_attempts
end

get '/bounces' do
  erb :bounces
end

get '/rejects' do
  erb :rejects
end

get '/complaints' do
  erb :complaints
end