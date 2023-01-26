module Api
  class UserController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        render json: {status: 'SUCCESS', msg: 'Created user', data: user}, status: :ok
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    private
      def user_params
        params.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :role)
      end
  end
end