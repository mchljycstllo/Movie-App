module Api 
  class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :set_movie, only: [:create]
    #before_action :authenticate_user!, only: [:create, :destroy] TODO

    include MovieConcern

    # GET /comments
    def index
      @comments = Comment.all

      render json: @comments
    end

    # GET /comments/1
    def show
      render json: @comment
    end

    # POST /comments
    def create
      @comment = Comment.new(comment_params)

      @existing_comment = Comment.where(
        user_id: params[:user_id], 
        movie_id: params[:movie_id]
      ).first
      
      if @existing_comment
        render json: {status: 'ERROR', errors: ['cannot add another comment']}, status: :unprocessable_entity
      else
        if @comment.save
          render json: @comment, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /comments/1
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /comments/1
    def destroy
      #@comment.destroy
      if check_user == 1
        @comment.update_attribute(:deleted, true)
        render json: {status: 'SUCCESS', msg: 'Deleted comment', data: @comment}, status: :ok
      else
        render json: {status: 'ERROR', errors: ["You don't have the right to delete this comment"]}, status: :unprocessable_entity
      end
      #render json: @comment.user_id == current_user.id
      #render json: check_user
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        begin
          @comment = Comment.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: {status: 'ERROR', errors: ['No comment found']}, status: :unprocessable_entity
        end
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.permit(:user_id, :movie_id, :content)
      end

      def check_user
        #TODO
        # if current_user.id == @comment.user_id || current_user.role == 'admin'
        #   return 1
        # else
        #   return 0
        # end
        return 1
      end
  end
end