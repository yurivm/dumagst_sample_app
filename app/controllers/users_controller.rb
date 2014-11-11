class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def index
    @users = User.paginate(:page => params[:page])
  end

  def with_recommendations
    ids_with_recommendations = engine.users_with_recommended_products
    @users = User.find(ids_with_recommendations).paginate(:page => params[:page])
    @title = "Users with recommendations"
    render 'index'
  end

  def show
    @product_recommendations = engine.recommend_products(@user.id)
    @user_recommendations = engine.recommend_users(@user.id)
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def engine
    @engine ||= Dumagst::Engines::JaccardEngine.new(engine_key: "jaccard_native_similarity")
  end
end
