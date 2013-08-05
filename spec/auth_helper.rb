module AuthHelper
  def http_login(user='dummy', pw='drwho')
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end  
end