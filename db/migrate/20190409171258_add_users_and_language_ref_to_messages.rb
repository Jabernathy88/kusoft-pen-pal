class AddUsersAndLanguageRefToMessages < ActiveRecord::Migration[5.2]
  def change
    change_table :messages do |t|
      t.references :sender
      t.references :recipient
      t.references :language, foreign_key: true

    end 
  end
end