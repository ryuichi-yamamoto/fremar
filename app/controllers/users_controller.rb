class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @users = User.new
  end

  def create
  end

  def edit
    @users = User.find(params[:id])
    @addresses = Addrerre.find(params[:id])
  end

  def update
  end
  
  def destroy
  end

  def done
  end

end
