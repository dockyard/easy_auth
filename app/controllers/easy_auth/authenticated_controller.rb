class EasyAuth::AuthenticatedController < ::ApplicationController
  before_filter :attempt_to_authenticate

  private

  def attempt_to_authenticate
    if user_not_signed_in?
      session[:requested_path] = request.path
      redirect_to main_app.sign_in_path
    end
  end
end
