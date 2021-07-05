class Event < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :visible, presence: true
end
