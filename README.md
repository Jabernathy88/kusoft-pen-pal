# kusoft-pen-pal

A small language-learning API. 

### Requirements to deliver

The application you'll be building is a simple Rails API; no Rails views or frontend is needed. All requests should return data in JSON format. The application should be backed by a Postgres database.

The application will be a language-learning-via-penpal tool. Users of the application will be able to sign up, indicate the languages that they are interested in and their proficiency level, and send messages to each other.

Given the small scope of this project, you don't need to worry about authentication & authorization; anyone with access to the API should be able to hit any endpoint it exposes.

The primary tables & the data they should hold are:

`users`
 - Email address
 - First name
 - Last name

`languages`
 - Name
 - Average level of proficiency of all users who are interested in it

`messages`
 - User who sent the message (foreign key)
 - User who received the message (foreign key)
 - Language the message is in (foreign key)
 - Text of the message

`proficiencies`
 - User (foreign key)
 - Language (foreign key)
 - Proficiency level, on a scale of 1 to 10

Additional requirements:

Messages are only valid if both the recipient & receiver have proficiencies in the message's language with values within 2 of each other.

Languages cannot be deleted if they are referenced by proficiencies or messages. All other deletions should cascade.

Each resource should have an index/list endpoint, along with show, create, update, & delete endpoints.

### Requirements translated into user stories

As any user, I can see an index listing all Users, or I can show one User at a time, selected by id#. (Index, Show)

^ Ditto for all other resources: Languages, Proficiencies, Messages.

As any user, I can create, update, or destroy any User's record. (Create, Edit, Delete)

As any user, I can create, update, or destroy any Language record. (Create, Edit, Delete)

 ---

As any user, I can create, update, or destroy any Proficiency, and I can indicate which User owns the Proficiency by providing the User's id#. (Create, Edit, Delete)

As any user, I can create, update, or destroy any Message, and I can indicate the Sender and Recipient by their User id#.

As any user, I will not be able to create or update a Message unless certain conditions are met. For example:

* Alice has an English proficiency of 6. Bob has an English proficiency of 8. Alice **can** send a message to Bob in English.

* Alice's Spanish is 4, while Bob's Spanish is 8. Alice **cannot** send a message to Bob in Spanish. 

* Alice's has Japanese proficiency, but Bob does not have any proficiency in Japanese. Alice **cannot** send a message to Bob in Japanese. 

As any user, if I try to delete a Language with association records, I will receive an polite error notice instead. 

Otherwise, I should not have trouble deleting other records. (Dependend destroy)