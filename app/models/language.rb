class Language < ApplicationRecord
    has_many :proficiencies # will not cascade
    has_many :messages, dependent: :destroy
end