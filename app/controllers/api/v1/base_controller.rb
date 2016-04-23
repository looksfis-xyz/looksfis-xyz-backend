class Api::V1::BaseController < ApplicationController

private
  def current_user
    User.find(params[:user_id])
  end
end
