# kusoft-pen-pal

A small language-learning API. 

### Deployed API address

Root: [kusoft-pen-pal.herokuapp.com](https://kusoft-pen-pal.herokuapp.com)

Specific routes must be accessed using the `api/v1/` namespace as shown below.

Example serialized route: [kusoft-pen-pal.herokuapp.com/api/v1/users/1](https://kusoft-pen-pal.herokuapp.com/api/v1/users/1)

### Additional JSON request documentation in Postman

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/0b1788f79c9332fcc6bd)

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

1. *(Done)* As any user, I can see an index listing all Users, or I can show one User at a time, selected by id#. (Index, Show)

2. ^ Ditto for all other resources: Languages, Proficiencies, Messages. *(Done)*

3. *(Done)* As any user, I can create, update, or destroy any User's record. (Create, Edit, Delete)

4. *(Done)* As any user, I can create, update, or destroy any Language record. (Create, Edit, Delete)

5. *(Done)* As any user, I can create, update, or destroy any Proficiency, and I can indicate which User owns the Proficiency by providing the User's id#. (Create, Edit, Delete)

6. *(Done)* As any user, I can create, update, or destroy any Message, and I can indicate the Sender and Recipient by their User id#s.

7. *(Done)* As any user, I will not be able to create or update a Message unless certain conditions are met. For example:

    * Alice has an English proficiency of 6. Bob has an English proficiency of 8. Alice **can** send a message to Bob in English. *(Done)*

    * Alice's Spanish is 4, while Bob's Spanish is 8. Alice **cannot** send a message to Bob in Spanish. *(Done)*

    * Alice's has Japanese proficiency, but Bob does not have any proficiency in Japanese. Alice **cannot** send a message to Bob in Japanese. *(Done)*

8. *(Incomplete)* As any user, when I request to see any Language, the system will also show the current average proficiency among all Users. 

9. *(Done)* As any user, I cannot delete a Language if it is referenced by a Proficiency record. 

10. *(Done)* Otherwise, I should not have trouble deleting other records. (Dependent destroy)