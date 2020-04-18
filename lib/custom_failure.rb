class CustomFailure < Devise::FailureApp
  def redirect_url
    new_user_registration_path
  end

  def respond
    if http_auth?
        http_auth
    else
        redirect
    end
  end
end