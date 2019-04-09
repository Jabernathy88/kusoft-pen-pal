class Language < ApplicationRecord
    has_many :proficiencies
    has_many :messages
end
