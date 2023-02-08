module Api
  class SessionController < ApplicationController
    before_action :authenticate_user!

    def show
      user = current_user
      render json: {
        message: 'user data',
        user: user
      }
    end
  end
end