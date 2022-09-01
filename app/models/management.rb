class Management < ApplicationRecord
    belongs_to :category
    belongs_to :user

    has_many :favorites, dependent: :destroy
end
