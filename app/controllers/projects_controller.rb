class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update]
  before_action :famous_projects, only: [:new, :create, :edit, :show, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(is_public: true).order('created_at desc').page(params[:page]).per(20)
    @tags = Project.tag_counts_on(:tags).order('count DESC').limit(10)
    @rand = rand(5) + 5 # 5 ~ 10
    @disabled = user_signed_in? ? "" : "disabled"
  end

  def tag
    @projects = Project.tagged_with(params[:tag]).includes(:tags).order(created_at: :desc).page(params[:page]).per(30)
    render :index
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project.view += 1
    @project.save
    @comments = @project.comments
    @disabled = (user_signed_in?) ? "" : "disabled"
  end

  # GET /projects/new
  def new
    @project = Project.new
    gon.available_tags = Project.tags_on(:tags).pluck(:name)
  end

  # GET /projects/1/edit
  def edit
    gon.available_tags = Project.tags_on(:tags).pluck(:name)
    gon.project_tags = @project.tag_list
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.view = 0
    @project.good = 0
    @project.is_public = true
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: "ポートフォリオが登録されました。" }
        format.json { render :index, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to root_path, notice: 'ポートフォリオが更新されました。' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'ポートフォリオが削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:url, :title, :image, :youtube, :description, :tag_list)
    end

    def famous_projects
      @famous = Project.order('view desc').limit(3)
    end
end
