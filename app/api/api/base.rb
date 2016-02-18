module API
class Base < Grape::API
  prefix "api"
  format :json

  helpers do
  end

  resource :projects do
    desc "Return all projects"
    params do
      optional :page, type: Integer, default: 1
    end
    get "/" do
      @projects = Project.where(is_public: true).page(params[:page]).per(30)

    end

    desc "Return a project"
    get "/:id" do
      begin
        @project = Project.find(params[:id])
      rescue
        error!("NotFound", 404)
      end
      return {"status": 200, "message": "OK"} if @project
    end

    desc "create Project"
    params do
      optional :title, type: String
      optional :description, type: String
    end
    post "/" do
      error!("BadRequest", 400) unless params[:title] && params[:description]
      @project = Project.new(title: params[:title], description: params[:description], is_public: false)
      #error!("OK", 200)
      return {"status": 200, "message": "OK"}
    end

    desc "delete Project"
    delete "/:id" do
      begin
        @project = Project.find(params[:id])
      rescue
        error!("NotFound", 404)
      end
      @project.destroy
      return {"status": 200, "message": "OK"} if @project.frozen?
    end
  end

end
end