class AddUsersAndLanguageRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :recipient_user, foreign_key: true
    add_reference :messages, :language, foreign_key: true

  end
end