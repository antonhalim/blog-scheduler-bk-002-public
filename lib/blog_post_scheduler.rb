  require 'pry'
def create_groups(student_list, group_size, total_days)
    finalarray = []
    grouparray = []
    counter = 0
    randomized = student_list.shuffle
    total_days.times do |speaker|
      group_size.times do |number|
        grouparray << randomized[counter]
        counter += 1
      if counter == randomized.length
          counter = 0
      end
      end
      finalarray << grouparray
      grouparray = []
    end
    finalarray
end
    # finalarray = Array.new(total_days){Array.new(group_size, student_list.shuffle)}
