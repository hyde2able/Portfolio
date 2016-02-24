class GoodProject < ActiveRecord::Base
    belongs_to :user, touch: true
    belongs_to :project, touch: true

    validates :user, presence: true
    validates :project, presence: true
    validates :user_id, uniqueness: {scope: :project_id}
end
