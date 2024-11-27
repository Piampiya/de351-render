class SearchController < ApplicationController
  def index
    @query = Post.includes(:user, :category).ransack(params[:q])
    @posts = @query.result(distinct: true)
  end
end
