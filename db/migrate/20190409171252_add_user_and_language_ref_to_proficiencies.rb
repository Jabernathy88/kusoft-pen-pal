class AddUserAndLanguageRefToProficiencies < ActiveRecord::Migration[5.2]
  def change
    add_reference :proficiencies, :user, foreign_key: true
    add_reference :proficiencies, :language, foreign_key: true
  end
end
