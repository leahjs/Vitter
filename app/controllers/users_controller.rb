class UsersController < ApplicationController
  def new
    @user = User.new(:user_id => current_user.id)
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end
end
