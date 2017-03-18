class BranchesController < ApplicationController
  get '/branches/new' do # displays 'create Branch' form
    if logged_in?
      erb :'branches/create_branch'
    else
      redirect to '/login'
    end
  end

  post '/branches' do # created Branch is submitted to database
    if params[:content] == "" # checks submission for content
      redirect to '/branches/new' # if none found redirects user to new Branch form
    else
      user = User.find_by_id(session[:user_id])
      @branch = Branch.new(:event => params[:event], :organization => params[:organization], :date => params[:date], :location  => params[:location], :info  => params[:info], :user_id  => user.id)
      @branch.save
      redirect to "/branches"
   end
  end

  get '/branches' do # displays information for a single Branch
    if logged_in?
      @branches = Branch.all
      erb :'branches/branches'
    else
      redirect to '/login'
    end
  end

  get '/branches/:id' do # shows specific branch 
    if logged_in?
      @branch = Branch.find_by_id(params[:id])
      erb :'branches/show_branch'
    else
      redirect to '/login'
    end
    end

  get '/branches/:id/edit' do # load branch edit form
    if logged_in?
      @branch = Branch.find_by_id(params[:id])
        if @branch.user_id == current_user.id # ensures the branch to be edited belongs to the current_user
          erb :'branches/edit_branch'
        else
          flash[:message] = "You can't edit a Branch that isn't yours!"
          redirect to "/branches"
        end
    else
      redirect to "/login"
    end
  end

  patch '/branches/:id' do # updates branch in database
    if params[:content] == "" # checks submission for content
      redirect to "/branches/#{params[:id]}/edit" # if none found redirects user to edit form form for particular branch
    else
      @branch = Branch.find_by_id(params[:id])
      if @branch.user_id == current_user.id
        @branch.event = params[:event]
        @branch.organization = params[:organization]
        @branch.date = params[:date]
        @branch.location = params[:location]
        @branch.info = params[:info]
        @branch.save
        redirect to "/branches/#{@branch.id}"
      else
        redirect to "/branches/:id/edit"
      end
    end
  end

    delete '/branches/:id/delete' do  # form to delete a Branch (no fields / submit bttn)
      if logged_in?
        branch = current_user.branches.find_by(id: params[:id]) # by including "curent_user.branches", we make a point to only search the current user's branches rather than all existing cases.
      if branch && branch.destroy
        redirect "/branches"
      else
        flash[:message] = "You can't delete a Branch that isn't yours!"
        redirect "/branches"
      end
      else
        redirect to "/login"
      end
    end
end