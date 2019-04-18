class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(chirp_id: params[:chirp_id],
                            content: params[:content],
                            user_id: current_user.id
                          )

    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = "Comment added!"
          redirect_to "/chirps/#{params[:chirp_id]}"
        end

        format.json {render json: 
          {
            status: 201,
            user: @comment.user,
            comment: @comment,
            comment_formatted_time: @comment.formatted_time
          }
        }
      end
    else
      respond_to do |format|
        format.html do
          @chirp = Chirp.find(params[:chirp_id])
          render 'chirps/show'
        end

        format.json {render json: {status: 400, errors: @comment.errors.full_messages}}
      end
    end
  end


  def destroy
    Comment.find(params[:comment_id]).destroy
    flash[:success] = "Comment deleted."
    redirect_to "/chirps/#{params[:chirp_id]}"
  end
end
