class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :management

    validates_uniqueness_of :management_id, scope: :user_id
end
