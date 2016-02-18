class GoodProjectsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

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