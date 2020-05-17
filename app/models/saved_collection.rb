class SavedCollection < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :user, optional: true
end
