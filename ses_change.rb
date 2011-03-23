# TODO:
#   ensure settings are only loading once
#   README
#   google charts
#   gitignore
#   embeded as rack app
#   http_simple auth

require 'rubygems'
require 'yaml'
require 'sinatra'
require 'aws/ses'
require 'erb'
require './ses_change_initializer'

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

post '/verified_email_addresses' do
  begin
    @ses.addresses.verify(params[:email_address])
    @verification_message = "Amazon is sending an activation message to #{params[:email_address]}"
  rescue Exception => e
    @verification_message = e.to_s
  end
  erb :index
end