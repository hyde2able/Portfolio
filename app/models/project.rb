class Project < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: { message: "を入力してください" }
    validates :url, presence: {message: "を入力してください" }
    validates :description, presence: { message: "を入力してください" }

    acts_as_taggable
end
