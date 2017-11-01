require './config/environment'
require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "branch_secret"
    use Rack::Flash, :sweep => true
  end

  get '/' do
    erb :index
  end

 helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
