class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def index
    @users = User.all.limit(100)
  end

  def show
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
