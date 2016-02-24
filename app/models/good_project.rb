class GoodProject < ActiveRecord::Base
    belongs_to :user
    belongs_to :project, touch: true

    validates :user, presence: true
    validates :project, presence: true
    validates :user_id, uniqueness: {scope: :project_id}
end
