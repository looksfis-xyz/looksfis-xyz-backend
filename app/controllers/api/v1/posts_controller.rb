module Api
  module V1
    class Api::V1::PostsController < Api::V1::BaseController
      def index
        @posts = Post.where(is_complete: false)
        if params[:longitude].present? && params[:latitude].present?
          @posts = @posts.near([params[:latitude], params[:longitude]], params[:radius])
        end
        @posts = @posts.joins(:fishing_gear).where("fishing_gears.category_id Like ?",  params[:category_id]) if params[:category_id].present?
        if @posts.present?
          render 'api/v1/posts/index', status: :ok
        else
          render json: { status: "Posts are not found" }, status: :not_found
        end
      end
    end
  end
end