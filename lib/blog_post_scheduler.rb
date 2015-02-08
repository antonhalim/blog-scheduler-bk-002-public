def create_groups(student_list, group_size, total_days)
  require 'pry'

    finalarray = Array.new(total_days){Array.new(group_size, student_list.shuffle)}
    # finalarray = []
    # grouparray = []
    # counter = 0
    # randomized = student_list.shuffle
    # total_speakers = group_size * total_days
    # total_speakers.times do |speaker|
    #   group_size.times do |number|
    #     grouparray << randomized[counter]
    #     counter += 1
    #   # binding.pry
    #   end
    #   if counter == (randomized.length)-1
    #       counter = 0
    #   end
    #   finalarray << grouparray
    #   grouparray = []
    # end
    # finalarray
 # final_groups = (student_list.shuffle * total_days).each_slice(group_size).to_a
end
