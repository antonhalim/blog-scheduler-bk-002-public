---
  tags: tdd, arrays, iteration
  languages: ruby
  resources: 2
---

# Blog Scheduler

## Background

At Flatiron, when we create the blog post schedule, we don't like to make students present their blog on consecutive days, because we know that any good post takes some time to write.

We could manually create these groups but you're here to learn to program and we're here to teach it so let's automate the blog post schedule task.

The number of total groups we want to make is the total number of days that students should present blogs, usually around 45 days. The number of group members is usually around 4, becuase four students present a day.

This program should be able to take an array of student names, a desired group size, and the number of total groups you would like. It should output a double-nested array:

```ruby
[
  ["Thomas Piketty",   "Arthur Goldhammer", "Edith Abbott"],
  ["Ungku Abdul Aziz", "Francine D. Blau",  "János Kornai"],
  ["Raúl Prebisch",    "Zhou Xiaochuan",    "Linda Yueh"  ],
  ["Basil Yamey",      "Myron Scholes",     "John Law"    ]
]

```

* In the above array, the is a total of four groups
* Each group has three members:
  * Thomas, Aurthur, and Edith are in a group together
  * Basil, Myron, and John are in a group together
  * etc.

For instance, say you're scheduling speakers for a conference on the economy. The conference lasts four days and you want to have two economists talk on a day. That means the group size would be two, the total number of speakers per day, while the total number of groups would be four, the total number of days to fill.

```ruby
economists = [
  "Thomas Piketty", 
  "Arthur Goldhammer", 
  "Edith Abbott",
  "Ungku Abdul Aziz",
  "Francine D. Blau",
  "János Kornai",
  "Raúl Prebisch",
  "Zhou Xiaochuan"
]

num_of_speakers_a_day = 2
num_of_days = 4

result = create_groups(economists, num_of_speakers_a_day, num_of_days)

# =>
# [
#   ["Thomas Piketty",   "Arthur Goldhammer"],
#   ["Edith Abbott",     "Ungku Abdul Aziz" ],
#   ["Raúl Prebisch",    "Zhou Xiaochuan"   ],
#   ["Francine D. Blau", "János Kornai"     ]
# ]

result.length == 4
# => true

result.collect {|group| group.length == 2}
# => [true, true, true, true]
```

Easy, right?

However, things could get more complicated. For instance, say your conference now lasts five days. You haven't been able to get any other economists to speak, but you want three speakers a day. Well, now you'll have to repeat speakers.

You know that economists don't like speaking two days in a row because they need at least a full day to prepare for a talk. Well, you should be able to call on your program like

```ruby
economists = [
  "Thomas Piketty", 
  "Arthur Goldhammer", 
  "Edith Abbott",
  "Ungku Abdul Aziz",
  "Francine D. Blau",
  "János Kornai",
  "Raúl Prebisch",
  "Zhou Xiaochuan"
]

num_of_speakers_a_day = 3
num_of_days = 5

result = create_groups(economists, num_of_speakers_a_day, num_of_days)

# =>
# [
#   ["Thomas Piketty", "Edith Abbott", "Arthur Goldhammer"],
#   ["Ungku Abdul Aziz", "Francine D. Blau", "János Kornai"]
#   
#   ["Francine D. Blau","János Kornai"],
#   ["Raúl Prebisch", "Zhou Xiaochuan"]
# ]

result.length == 5
# => true

result.collect { |group| group.length == 3 }
# => [true, true, true, true]
```

## Instructions

* Create a method called `create_groups` accepts the following arguments in order:
  * Array of student names
  * Number of students that will present a day
  * Total number of blog-post presentation days
* This method should return an array of groups of of students with no student in adjacent groups.

## Resources
* [Ruby Docs](http://www.ruby-doc.org/) - [Array Documentation](http://www.ruby-doc.org/core-2.1.1/Array.html)
* [A Blog About Code](http://ablogaboutcode.com/) - [The & Operator in Ruby](http://ablogaboutcode.com/2012/01/04/the-ampersand-operator-in-ruby/)
