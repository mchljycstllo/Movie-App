module UserConcern
  def fetch_all_users
    users = User.where(deleted: false)
  end

  def update_user
    user = User.find(params[:id])
    #update properties
    user.update(
      email: params[:email],
      full_name: params[:full_name],
      user_name: params[:user_name],
      role: params[:role]
    )
    
    if (params[:image])
      user.update(
        image: params[:image]
      )
    end

    if params.has_key?(:password)
      user = User.find(params[:id])
      user.password = params[:password]
      user.password_confirmation = params[:password]
      user.save
    end


    render json: {
      data: user
      #password: password.encrypted_password
    }, status: :ok
  end

  
end