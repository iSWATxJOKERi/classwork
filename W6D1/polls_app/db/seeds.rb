# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create([
    { username: 'kevin'},
    { username: 'iSWATxJOKERi'},
    { username: 'lawrence'}
])

all_polls = Poll.create([
### POLL 1 ###
    { 'user_id' => 1, 'title' => 'first_poll' },
### POLL 2 ###
    { 'user_id' => 2, 'title' => 'second_poll' },
### POLL 3 ###
    { 'user_id' => 2, 'title' => 'third_poll' },
### POLL 4 ###
    { 'user_id' => 3, 'title' => 'fourth_poll' }
])

questions = Question.create([
### POLL 1 ###
    { 'poll_id' => 1, 'body' => "what\'s good?"},
    { 'poll_id' => 1, 'body' => "wash poppin?"},
    
### POLL 2 ###
    { 'poll_id' => 2, 'body' => "how are you?"},
    
### POLL 3 ###
    { 'poll_id' => 3, 'body' => "?"},

### POLL 4 ###
    { 'poll_id' => 4, 'body' => "?!"}
])

choices = AnswerChoice.create([
### POLL 1 ###
    { 'question_id' => 1, 'body' => "big chillin"},
    { 'question_id' => 1, 'body' => "small chillin"},
    { 'question_id' => 2, 'body' => "im fine"},
    { 'question_id' => 2, 'body' => "nothin much"},
    { 'question_id' => 2, 'body' => "aint nun"},

### POLL 2 ###
    { 'question_id' => 3, 'body' => "yea"},
    { 'question_id' => 3, 'body' => "ai so boom"},

### POLL 3 ###
    { 'question_id' => 4, 'body' => "!"},

### POLL 4 ###
    { 'question_id' => 5, 'body' => "okay"}
])

responses = Response.create([
### POLL 1 ###
    { 'answer_choice_id' => 1, 'user_id' => 2},
    { 'answer_choice_id' => 2, 'user_id' => 3},
    { 'answer_choice_id' => 3, 'user_id' => 2},
    { 'answer_choice_id' => 3, 'user_id' => 3},

### POLL 2 ###
    { 'answer_choice_id' => 6, 'user_id' => 1},
    { 'answer_choice_id' => 7, 'user_id' => 3},

### POLL 3 ###
    { 'answer_choice_id' => 8, 'user_id' => 1},
    { 'answer_choice_id' => 8, 'user_id' => 3},

### POLL 4 ###
    { 'answer_choice_id' => 9, 'user_id' => 1},
    { 'answer_choice_id' => 9, 'user_id' => 2}

])
