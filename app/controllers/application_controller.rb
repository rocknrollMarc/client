class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :set_cors_headers
  before_filter :cors_preflight

  def set_cors_headers
    headers['AccessControl-Allow-Origin'] = AppConfig.client['origin']
    headers['AccessControl-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['AccessControl-Allow-Headers'] = '*'
    headers['AccessControl-Allow-Max-Age'] = "362880"
  end

  def cors_preflight
    head(:ok) if request.method == :options
  end

  private

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || form_authenticity_token ==
      request.headers['HTTP_X_XSRF_TOKEN']
  end
end
