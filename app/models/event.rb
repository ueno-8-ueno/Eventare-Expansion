class Event < ApplicationRecord
    belongs_to :members

    validates :name, presence: true
    validates :introduction, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true
end
