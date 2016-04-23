module Api
  module V1
    class SessionsController < BaseController
      def create
        @user = User.find_by_email(params[:user][:email].downcase)
        if @user.present? && @user.authenticate(params[:user][:password])
          @session =  @user.sessions.new
          if @session.save
            render 'api/v1/sessions/create', status: :created
          else
            render json: @session.errors, status: :bad_request
          end
        else
          render json: { errors: "You email and password don't match." }, status: :unauthorized
        end
      end
    end
  end
end
