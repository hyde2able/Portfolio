class GoodProjectsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def toggle
        return unless user_signed_in?
        @good_projects = current_user.good_projects
        if @good_projects.exists?( project_id: params[:project_id])
            @good_projects.where(project_id: params[:project_id])
        else
            @good_projects.create(user_id: current_user.id, project_id: Project.find(params[:project_id]))
        end
        render :nothing => true
    end

    def create
        @project = Project.find(params[:project_id])
        @good = @project.good_projects.new
        @good.user_id = current_user.id
        @err = true unless @good.save
        render "good/create"
    end

    def destroy
        @project = Project.find(params[:project_id])
        @good = @project.good_projects.find_by(current_user.id)
        @good.destroy
        render "good/destroy"
    end

end


  def create
    @favorite = Favorite.find_or_create_by(comment_id: params[:comment_id], user_id: current_user.id)
    render layout: nil
  end

  def destroy
    @favorite = Favorite.find_by(params[:id])
    @favorite.destroy
  end