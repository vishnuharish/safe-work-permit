class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:email]) || User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts user.firstname
      redirect_to dummy_index_path
    else 
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
