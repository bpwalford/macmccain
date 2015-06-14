module AuthHelper

  class AccessDenied < StandardError
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def ensure_admin
    unless current_user.admin
      raise AccessDenied
    end
  end

end
