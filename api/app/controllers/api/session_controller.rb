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
        user = User.where(id: params[:id], deleted: false).first
        render json: {status: 'SUCCESS', msg: 'fetched data', data: user}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {
          errors: ['User not found']
        }, status: :unprocessable_entity
      end
    end

    def validate_registration_info
      errors = []
      
      existing_user_via_email = User.where(email: params[:email]).first
      if existing_user_via_email 
        
        if params.has_key?(:user_id)
          if params[:user_id].to_i != existing_user_via_email.id
            errors.push('Email has already been taken')
          end
        else
          errors.push('Email has already been taken')
        end
      end

      existing_user_via_user_name = User.where(user_name: params[:user_name]).first
      if existing_user_via_user_name
        if params.has_key?(:user_id)
          if params[:user_id].to_i != existing_user_via_user_name.id
            errors.push('Username has alreay been taken')
          end
        else
          errors.push('Username has alreay been taken')
        end
      end

      if errors.length > 0
        render json: {
          valid: false,
          errors: errors
        }, status: :unprocessable_entity
      else
        render json: {
          valid: true
        }, status: :ok
      end

      #test render
      # render json: {
      #   has_key: params[:user_id].to_i != existing_user_via_email.id
      # }
    end
  end
end