module Api
  class UsersController < ApplicationController
    include UserConcern

    def index
      users = fetch_all_users
      render json: {
        data: {
          users: users
        }
      }, status: :ok
    end
  end
end
