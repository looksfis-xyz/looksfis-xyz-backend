class ApplicationController < ActionController::Base

  def current_session
    return @current_session ||= Session.find_by_session_token(get_session_token)
  end

  def current_user
    return @current_user ||= current_session.user if current_session && current_session.user.is_active
  end

  private

    def get_session_token
      return request.headers["Authorization"].split(' ').last if request.headers["Authorization"].present?
    end

  # private
end
