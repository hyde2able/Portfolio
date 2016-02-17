class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    redirect_to root_path unless user_signed_in?

    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
        render
    else
        @err = true
        render
    end

  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    render
  end

  private
    def comment_params
        params.require(:comment).permit(:body)
    end
end