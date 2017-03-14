class UsersController < ApplicationController

  get '/signup' do # displays user signup form
    if logged_in?
     redirect to "/branches"
   else
     erb :'users/create_user', locals: {message: "Please create an account below."}
   end
  end

 post '/signup' do # submits user signup form to database
    if params[:username] == "" || params[:email] == "" || params[:password] == "" #if submitted values are blank direct user back to signup page
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/branches"
    end
  end

  get '/login' do # displays login info
  if !session[:user_id]
    erb :'users/login'
  else
    redirect "/branches"
  end
end

post '/login' do # submits login and establishes session_id
  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/branches"
  else
    redirect to "/signup"
  end
end

get '/users/:slug' do
   @user = User.find_by_slug(params[:slug])
   erb :'users/show'
 end

get '/logout' do # logs out user / clears session hash
  if session[:user_id] != nil
    session.destroy
    redirect to '/login'
  else
    redirect to '/'
  end
end

end