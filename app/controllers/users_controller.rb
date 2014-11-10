class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def index
    #@users = User.all.limit(100)
    @users = User.paginate(:page => params[:page])
  end

  def show
    engine = Dumagst::Engines::JaccardEngine.new(engine_key: "jaccard_native_similarity")
    @product_recommendations = engine.recommend_products(@user.id)
    @user_recommendations = engine.recommend_users(@user.id)
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
