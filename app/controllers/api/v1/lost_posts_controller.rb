module Api
  module V1
    class Api::V1::LostPostsController < Api::V1::BaseController
      def create
        @lpost = current_user.lost_posts.new(post_params)
        if @post.save
          render 'api/v1/posts/show', status: :ok
        else
          render json: @post.errors.messages, status: :bad_request
        end
      end


    private
      def post_params
        fishing_gear_attributes = [:category_id. :name ,:mesh_size ,:length ,:width ,:weight ,:color ,:comment ,:production_country_alpha2]
        params.require(:post).permit(:is_complete, :title, :longitude, :latitude, :radius, :report_date, fishing_gear_attributes: fishing_gear_attributes)
      end
    end
  end
end
