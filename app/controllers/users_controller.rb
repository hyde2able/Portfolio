class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favo = @user.good_projects

    respond_to do |format|
      format.html #show.html.erb

      format.pdf do
        html = "<h2 class='text-center'>#{@user.username}のポートフォリオ</h2>"
        html += params[:html]
        pdf = PDFKit.new(html, encoding: "UTF-8")
        pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"

        send_data pdf.to_pdf, ffilename: "#{@user.username}のポートフォリオ.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end
end