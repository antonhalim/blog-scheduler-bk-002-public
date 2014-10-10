---
tags: tdd, arrays, iteration
languages: ruby
resources: 4
---

# Blog Scheduler

## Contents

|Section                                          |
|-------------------------------------------------|
|[Background](#background)                        |
|[Intro to Examples](#introduction-to-examples)   |
|[Simple Example](#simple-example)                |
|[Complex Example](#complex-example)              |
|[Instructions](#instructions)                    |
|[Things to Keep in Mind](#things-to-keep-in-mind)|
|[Hints](#hints)                                  |
|[Bonus](#bonus)                                  |
|[Resources](#resources)                          |

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


## Introduction to Examples

For instance, say you're scheduling speakers for a conference on the economy. The conference lasts four days and you want to have two economists talk on a day. That means the group size would be two, the total number of speakers per day, while the total number of groups would be four, the total number of days to fill.

For the examples below, `economists` will be pointing to the array below;
```ruby
[
  "Thomas Piketty", 
  "Arthur Goldhammer", 
  "Edith Abbott",
  "Ungku Abdul Aziz",
  "Francine D. Blau",
  "János Kornai",
  "Raúl Prebisch",
  "Zhou Xiaochuan"
]
```

### Simple Example

```ruby
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

### Complex Example

Things can get more complicated. For instance, say your conference now lasts five days. You haven't been able to get any other economists to speak, but you want three speakers a day. Well, now you'll have to repeat speakers.

You know that economists don't like speaking two days in a row because they need at least a full day to prepare for a talk. Well, you should be able to call on your program like

Second example:

```ruby
num_of_speakers_a_day = 3
num_of_days = 5

result = create_groups(economists, num_of_speakers_a_day, num_of_days)
# =>
# [
#   ["Arthur Goldhammer", "János Kornai",     "Ungku Abdul Aziz" ], 
#   ["Raúl Prebisch",     "Zhou Xiaochuan",   "Thomas Piketty"   ], 
#   ["Francine D. Blau",  "Edith Abbott",     "Arthur Goldhammer"], 
#   ["János Kornai",      "Ungku Abdul Aziz", "Raúl Prebisch"    ], 
#   ["Zhou Xiaochuan",    "Thomas Piketty",   "Francine D. Blau" ]
# ]

result.length == 5
# => true

result.collect { |group| group.length == 3 }
# => [true, true, true, true, true]
```

## Instructions

* Create a method called `create_groups` accepts the following arguments in order:
  * Array of student names
  * Number of students that will present a day
  * Total number of blog-post presentation days
* This method should return an array of groups of of students with no student in adjacent groups.


## Things to Keep in Mind

#### Shuffle

The shuffle method arranges elements in an array in random order.

```ruby
fruits = ["apple", "banana", "carrot", "durian"]
# => ["apple", "banana", "carrot", "durian"]

fruits.shuffle
# => ["carrot", "durian", "banana", "apple"]
```

More info [here](http://www.ruby-doc.org/core-2.1.3/Array.html#method-i-shuffle).

#### Creating Multidimensional Arrays

```ruby
five_two_element_arrays = Array.new(5, Array.new(2))
# => 
# [
#   [nil, nil],
#   [nil, nil],
#   [nil, nil],
#   [nil, nil],
#   [nil, nil]
# ]

two_five_element_arrays = Array.new(2, Array.new(5))
# => 
# [
#   [nil, nil, nil, nil, nil], 
#   [nil, nil, nil, nil, nil]
# ]
```

More info [here](http://ruby.about.com/od/Writing-a-2048-Clone-in-Ruby/fl/Two-Dimensional-Arrays-in-Ruby.htm).

## Hints

It might be helpful to think about shuffling the students:

```ruby
randomized_students = student_list.shuffle
```

Then you could make a container for all the final groups:

```ruby
final_groups = []
```

In the next step you could set a counter, which will keep track of which student is the next to get added to a group. Initially set it equal to `0`, max equal to `student_list.length - 1`:

```ruby
counter = 0
max = randomized_students.length - 1
```

Finally, make a new array for each day and within the creation of these arrays, add student names to them.

```
number of total days do this:
  create a new empty array called group
  number of group members to this:
    shovel a student, found by calling the index `counter` on randomized_students, into the group array
    increment counter by one, or reset it to 0 if it will exceed max
  end
  shovel the group array into the final group array
end

```

Remember to return `final_groups`. Good luck!

## Bonus

Think of a way to accomplish this task in one line.

## Resources

* [Ruby Docs](http://www.ruby-doc.org/) - [Array Documentation](http://www.ruby-doc.org/core-2.1.1/Array.html)
* [A Blog About Code](http://ablogaboutcode.com/) - [The & Operator in Ruby](http://ablogaboutcode.com/2012/01/04/the-ampersand-operator-in-ruby/)
* [About.com](http://ruby.about.com/) - [Two Dimensional Arrays in Ruby](http://ruby.about.com/od/Writing-a-2048-Clone-in-Ruby/fl/Two-Dimensional-Arrays-in-Ruby.htm)
* [Ruby Docs](http://www.ruby-doc.org/) - [Shuffle Method](http://www.ruby-doc.org/core-2.1.3/Array.html#method-i-shuffle)
