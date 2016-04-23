module Api
  module V1
    class Api::V1::PostsController < Api::V1::BaseController
      def index
        @posts = Post.where(is_complete: false)
        if params[:longitude].present? && params[:latitude].present? && params[:radius].present?
          @posts = @posts.near([params[:latitude], params[:longitude]], params[:radius], units: :km)
        end
        @posts = @posts.joins(:fishing_gear).where("fishing_gears.category_code Like ?",  params[:category_code]) if params[:category_code].present?
        if @posts.present?
          render 'api/v1/posts/index', status: :ok
        else
          render json: { base: "Posts are not found" }, status: :not_found
        end
      end

      def found
        @post = Post.find(params[:id])
        if @post.present?
          if !@post.is_complete?
            if @post.update(is_complete: true, founder_id: current_user.id, found_date: Time.now)
              render 'api/v1/posts/show', status: :ok
            else
              render json: @post.errors.messeges, status: :bad_request
            end
          else
            render json: { base: "The fishing_gear is already found." }, status: :bad_request
          end
        else
          render json: { base: "The post is found" }, status: :not_found
        end
      end
    end
  end
end