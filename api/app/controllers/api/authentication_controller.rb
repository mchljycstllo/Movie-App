module Api
  class AuthenticationController < ApplicationController
    def login
      user = User.where(email: params[:email]).first
      #render json: {status: 'SUCCESS', msg: 'User exists', data: user}, status: :ok

      if user.valid_password?(params[:password])
        render json: {status: 'SUCCESS', msg: 'User exists', data: user}, status: :ok
      else
        render json: {status: 'ERROR', msg: 'User does not exist', data: nil}, status: :unprocessable_entity
      end
    end

    def logout

    end
  end
end