require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "branch_secret"
  end

  get '/' do
      erb :index
  end

  helpers do
    def logged_in?
      !!current_user # Rather than evaluating the session_id, confirming the current user (in this case, using !! bolean) avoids any issues with invalid id's
    end

    def current_user # Instance variable @current_user will be set once then cached / returned in future cases using the ||=
      @current_user ||= User.find(session[:id]) if session[:id]
    end
  end

end