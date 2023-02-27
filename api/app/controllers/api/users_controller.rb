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

    # PATCH/PUT /users/1
    def update
      @user = User.where(id: params[:id], deleted: false)
      update_user
    end

    def show
      render json: {
        user: @user
      }, status: :ok
    end

    def destroy
      @user.update_attribute(:deleted, true)
      #delete user comments and reviews
      delete_user_comments_and_ratings
      render json: {status: 'SUCCESS', msg: 'Deleted user', data: @user}, status: :ok
    end

    def update_user_role
      user = User.where(id: params[:user_id])
      user.update(role: params[:role])

      render json: {
        user: user
      }, status: :ok
    end

    private

    def delete_user_comments_and_ratings
      ratings = Rating.where(user_id: @user.id)
      ratings.each do |rating|
        rating.delete
      end

      comments = Comment.where(user_id: @user.id)
      comments.each do |comment|
        comment.delete
      end
    end

    def set_current_user
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['User not found']}, status: :unprocessable_entity
      end
    end

  end
end
