module Api
  class SessionController < ApplicationController
    before_action :authenticate_user!, only: [:show]

    def show
      user = current_user
      render json: {
        message: 'user data',
        user: user,
        token: @token
      }.to_json and return
    end

    def get_user_via_id
      begin
        user = User.find(params[:id])
        render json: {status: 'SUCCESS', msg: 'fetched data', data: user}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {
          errors: ['User not found']
        }, status: :unprocessable_entity
      end
    end
  end
end