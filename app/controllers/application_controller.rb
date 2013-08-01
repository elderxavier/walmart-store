class ApplicationController < ActionController::Base

  protected

  def authenticate
    if authenticate_with_http_basic { |u, p| u == 'dummy' && p == 'drwho'}
    else
      request_http_basic_authentication
    end
  end

end
