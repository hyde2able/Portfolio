class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    redirect_to root_path unless user_signed_in?

    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @comment.user_id = current_user.id

    ngWords = ["死ね", "バカ", "アホ", "カス", "ボケ", "きもい"]
    ngWords.each do |ng|
      if @comment.body.include?(ng)
        @err = true
        render
        return
      end
    end

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