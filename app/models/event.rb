class Event < ApplicationRecord
    belongs_to :member
    belongs_to :genre

    validates :name, presence: true
    validates :introduction, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true
end
