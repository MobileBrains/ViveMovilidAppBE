Warden::Strategies.add(:user_strategy) do
  def valid?
    !params[:email].blank? && !params[:password].blank?
  end

  def authenticate!
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      success!(user)
    else
      fail!("Could not log in")
    end
  end
end

Warden::Strategies.add(:vehicle_strategy) do
  def valid?
    !params[:email].blank? && !params[:password].blank?
  end

  def authenticate!
    vehicle = Vechicle.where(email: params[:email]).first
    if vehicle && vehicle.valid_password?(params[:password])
      success!(vehicle)
    else
      fail!("Could not log in")
    end
  end
end


