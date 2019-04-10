# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Proficiency.destroy_all
Language.destroy_all
User.destroy_all

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

# Four languages
english = Language.create(
  name: "English"
)
spanish = Language.create(
  name: "Spanish"
)
japanese = Language.create(
  name: "Japanese"
)
korean = Language.create(
  name: "Korean"
)

# Seven proficiencies
alice_english = Proficiency.create(
  level: 6,
  user: alice,
  language: english
)
alice_spanish = Proficiency.create(
  level: 4,
  user: alice,
  language: spanish
)
alice_japanese = Proficiency.create(
  level: 4,
  user: alice,
  language: japanese
)
alice_korean = Proficiency.create(
  level: 1,
  user: alice,
  language: korean
)
bob_english = Proficiency.create(
  level: 8,
  user: bob,
  language: english
)
bob_spanish = Proficiency.create(
  level: 8,
  user: bob,
  language: english
) 
# bob doesn't know any Japanese 
bob_korean = Proficiency.create(
  level: 4,
  user: bob,
  language: korean
)

# One message
bob_korean_to_alice = Message.create(
  text: "Hel-loh 'Annyong' Bluth is the adopted Korean son of Lucille and George Bluth via the Korean Consulate of Child Services. Annyong is portrayed by Justin Lee and appeared in 12 episodes of Arrested Development.",
  sender: bob,
  recipient: alice,
  language: korean
)
