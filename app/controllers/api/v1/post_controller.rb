class Api::V1::PostController < BaseController
  def index
    @posts = Post.where(is_complete: false)
    @posts = @posts.joins(:fishing_gear)where("fishing_gears.category_id Like ?",  params[:category_id]) if params[:category_id].parent?
    if params[:longitude].present? && params[:latitude].present?
      @posts = @posts.near(params[:latitude], params[:longitude], params[:radius])
    end
    if @posts.present?
      render 'api/v1/posts/index', status: :created
    else
      render json: { status: "Posts are not found" }, status: :not_found
    end
  end
end
