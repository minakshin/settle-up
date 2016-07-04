class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :require_no_authentication, only: [:cancel ]
  before_action :authenticate_user!
  skip_before_filter :authenticate_user!
end
