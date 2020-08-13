class CommentsController < ApplicationController
    
    def index
        
        @comments = []
        if params.has_key?(:user_id)
            @comments << Comment.where(commenter_id: params[:user_id])
        elsif params.has_key?(:artwork_id)
            @comments << Comment.where(artwork_id: params[:artwork_id])
        else
            raise "No ID found"
        end
        render json: @comments
    end
    
    def create

        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to comment_url(@comment)
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy

        @comment = Comment.find(params[:id])
        @comment.destroy
        
        redirect_to comments_url

    end


    private

    def comment_params
        params
            .require(:comment)
            .permit(:commenter_id, :artwork_id)
    end

end