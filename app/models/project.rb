class Project < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: { message: "を入力してください" }
    validates :url, presence: {message: "を入力してください" }
    validates :description, presence: { message: "を入力してください" }

    # いいね機能
    has_many :good_projects

    acts_as_taggable
    def favorited_by? user
        good_projects.find_by(user_id: user.id).present?
    end
end

