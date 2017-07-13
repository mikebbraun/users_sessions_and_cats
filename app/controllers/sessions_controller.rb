class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user and @user.authenticate(params[:password])
      # user exists and password is correct
      session[:user_id] = @user.id
      redirect_to cats_path
    else
      render :new
    end

    # REFACTORRED VERSION OF IF USER AND USER AUTHENTICATE ^^^
    # @user = User.find_by(username: params[:username]).
    #   try(:authenticate, params[:password])
    # if @user
    #   session[:user_id] = @user.id
    #   redirect_to cats_path
    # else
    #   render :new
    # end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
