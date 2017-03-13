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
      @branch = current_user.branches.create(
        event: params[:event],
        organization: params[:organization],  
        date: params[:date], 
        location: params[:location], 
        info: params[:info], 
        :user_id => user.id)
      redirect to "/branches/#{branch.id}"
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
      erb :'branches/show_branch'
    else
      redirect to '/login'
    end
    end

  get '/branches/:id/edit' do # load Branch edit form
    if logged_in?
      branch = current_user.branches.find_by(id: params[:id])
      erb :'branches/edit_branch'
    else
      redirect to '/login'
    end
  end

  patch '/branches/:id' do # updates Branch in database
    validates_presence_of :event, :organization, :date, :location, :info
      redirect to "/branches/#{params[:id]}/edit" # if none found redirects user to edit form form for particular Branch
    #else
    #branch = Branch.find_by_id(params[:id])
    #branch.content = params[:content]
    #branch.save
    #redirect to "/branches/#{branch.id}"
  end

    delete '/branches/:id/delete' do  # form to delete a Branch (no fields / submit bttn)
      if logged_in?
        branch = current_user.branches.find_by(id: params[:id]) # by including "curent_user.branches", we make a point to only search the current user's branches rather than all existing cases.
      if branch && branch.destroy
        redirect "/branches"
      else
        redirect "/branches/#{branch.id}"
      end
      else
        redirect to '/login'
      end
    end
end