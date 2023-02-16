module Api
  class UsersController < ApplicationController
    before_action :set_current_user, only: [:show, :update, :destroy]
    include UserConcern

    def index
      users = fetch_all_users
      render json: {
        data: {
          users: users
        }
      }, status: :ok
    end

    def show
      render json: {
        user: @user
      }, status: :ok
    end

    def destroy
      @user.update_attribute(:deleted, true)
      render json: {status: 'SUCCESS', msg: 'Deleted user', data: @user}, status: :ok
    end

    private
    def set_current_user
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No user found']}, status: :unprocessable_entity
      end
    end

  end
end
