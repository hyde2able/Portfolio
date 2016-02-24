class GoodProjectsController < ApplicationController
    #before_action :authenticate_user!, only: [:create, :destroy]

    def create
        # unless user_signed_in?
        #     @err = true
        #     @message = "ログインしてください。"
        #     render "good/create"
        #     return
        # end
        @user = current_user
        @project = Project.find(params[:project_id])
        @good = @project.good_projects.new
        @good.user_id = @user.id
        unless @good.save
            @err = true
            @message = "いいね！　ができませんでした。"
        end
        render "good/create"
    end

    def destroy
        # unless user_signed_in?
        #     @err = true
        #     @message = "ログインしてください。"
        #     render "good/destroy"
        #     return
        # end
        @user = current_user
        @project = Project.find(params[:project_id])
        @good = @project.good_projects.find_by(@user.id)
        @good.destroy
        render "good/destroy"
    end

end