# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Language.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Two users
alice = User.create(
  first_name: "Alice",
  last_name: "Appleton",
  email_address: 'alice@test.ghostmapmedia.com'
)
bob = User.create(
  first_name: "Bob",
  last_name: "Balish",
  email_address: 'balish@test.ghostmapmedia.com'
)

# Three languages
english = Language.create(
  name: "English"
)
spanish = Language.create(
  name: "Spanish"
)
japanese = Language.create(
  name: "Japanese"
)

# Five proficiencies
alice_english = Proficiency.create(
  # first_name: "Bob",
  # last_name: "Balish",
  # email_address: 'balish@test.ghostmapmedia.com'
)
