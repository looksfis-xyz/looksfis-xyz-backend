module Api
  module V1
    class UsersController < BaseController
      def create
        @user = User.new(user_params)
        if @user.save
          render 'api/v1/users/create', status: :created
        else
          render json: @user.errors.messages, status: :not_found
        end
      end

    private
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :mobile_phone, :password, :password_confirmation)
      end
    end
  end
end