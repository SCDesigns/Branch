class BranchesController < ApplicationController

  get '/branch/new' do # displays 'create Branch' form
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
      branch = Branch.create(:content => params[:content], :user_id => user.id)
      redirect to "/branches/#{branch.id}"
   end
  end

  get '/branches' do # displays information for a single Branch
    if logged_in?
      branches = Branch.all
      erb :'branches/branches'
    else
      redirect to '/login'
    end
  end

  get '/branches/:id' do
  if logged_in?
    branch = Branch.find_by_id(params[:id])
    erb :'branches/show_branch'
  else
    redirect to '/login'
  end
  end

  get '/branches/:id/edit' do # load Branch edit form
    if logged_in?
      branch = Branch.find_by_id(params[:id])
        if branch.user_id == current_user.id # ensures the Branch to be edited belongs to the current_user
          erb :'branches/edit_branch'
        else
          redirect to '/branches'
        end
    else
      redirect to '/login'
    end
  end

  patch '/branches/:id' do # updates Branch in database
    if params[:content] == "" # checks submission for content
      redirect to "/branches/#{params[:id]}/edit" # if none found redirects user to edit form form for particular Branch
    else
    branch = Branch.find_by_id(params[:id])
    branch.content = params[:content]
    branch.save
    redirect to "/branches/#{branch.id}"
    end
  end

    delete '/branches/:id/delete' do  # form to delete a Branch (no fields / submit bttn)
      if logged_in?
        branch = Branch.find_by_id(params[:id])
        if branch.user_id == current_user.id #ensures the Branch to be *deleted* belongs to the current_user
          branch.delete
          redirect to '/branches'
        else
          redirect to '/branches'
        end
      else
        redirect to '/login'
      end
    end
end