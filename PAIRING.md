## Instructions:
### 1. Create a tweet.rb file
### 2. Require that tweet file in the environment.rb
### 3. Set up the Tweet class. It should have the following methods:
#### `.setup_table`
  - This will set up the tweets table to have the following columns: id, message, user_id, and date
#### `#initialize`
  - Use the `send` method to instantiate tweet objects using an attribute hash as an argument.
#### `#save`
 - Insert new tweets into the database if they do not already exist in the database
 - Update the data saved to the database for tweets that already exist but have been modified
#### `#user`
  - Return the user object associated with that tweet’s user_id attribute
#### `.all`
 - Return an array of objects representing all the tweets in the database
#### `.unclaimed_tweets`
 - Return all the tweets that do not have an associated author.

### 4. Add a few methods to the User class  
#### `#tweets`
  -  This will return all the tweets from that user.
#### `.find_by_name`
  - This method will accept a string as an argument (i.e. “chris”) and search the database for a user with that name.  Return that user object if the user is found.


### 5. Run the console file to check your code is working
Run the code below one line at a time and check to make sure the return values make sense.
You should be able to run the following lines of code without seeing any errors:
```ruby
u = User.new(name: “Chris”, email: “chris@flatiron.com”)
u.save
user_two = User.new(name: “Jenn”, email: “jenn@flatiron.com”)
user_two.save
tweet_one = Tweet.new(message: “My first tweet!”, user_id: u.id, date: “dec 11”)
tweet_one.save
tweet_two = Tweet.new(message: “Who wrote this tweet?”, date: “dec 12”)
tweet_two.save

u.tweets # an array with tweet_one

user_two.tweets  # []

tweet_one.user  # user object with a name of Chris

Tweet.unclaimed_tweets # An array with tweet_two

User.find_by_name("Chris").tweets  # the array of tweets by Chris
```

### 6. Try playing around in the console
Add more tweets and try updating the tweets that have already been created. Test out what happens if you don't save each instance after it has been instantiated. Can you write a `.create` method so that you don't have to call both `.new` and `.save`?
