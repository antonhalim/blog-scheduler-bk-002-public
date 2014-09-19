# remember that tests can be your to-do list, and that you should get one
# test to pass at a time, doing the simplest thing you can for each one.

# read your rspec output carefully to find what you need to fix. the errors
# will guide you!

describe "Blog Post Scheduler" do

  describe "#create_groups" do
    # A bit about this let method below.
    # # http://betterspecs.org/#let
    # let will create a method named after the argument
    # that will execute the associated block every time 
    # it is called. It is a semantic way to define
    # subjects for your tests.

    # tl;dr - you call group_size in your test, it returns 4
    let (:group_size) { 4 } 
    let (:students) { get_students } 

    it "returns an array of groups" do
      expect(create_groups(students, group_size, 20).class).to eq(Array)
    end

    it "sets group sizes to the size given" do
      expect(create_groups(students, group_size, 20).first.size).to eq(group_size)
    end

    it "creates the right number of groups" do
      # pending "implement a test that ensures you get the right number of groups returned"
      expect(create_groups(students, group_size, 20).count).to eq(20)
    end

    it "uses every student in the list for a large enough number of groups" do
      groups = create_groups(students, group_size, 11)
      # puts groups.inspect
      expect(students.sort).to eq(groups.flatten.uniq.sort)
    end

    it "attempts to randomize the list" do
      #pending "implement a test that ensures that the list order returned is different from the student list"
      #hint: look at the test: 'it uses every student in the list...'
      groups = create_groups(students, group_size, 11)
      # puts groups.inspect
      expect(students.sort).to_not eq(groups.flatten)      
    end

    it "uses some studens more than once for a large enough number of groups" do
       groups = create_groups(students, group_size, 1000)
       groups.each do |group|
         expect(group.size).to eq(group_size)
       end
    end

    it "doesn't repeat students on adjacent days" do
      groups = create_groups(students, group_size, 20)
      groups.each_with_index do |group, i|
        expect((group & groups[i+1])).to eq([]) if i < groups.size - 1

        # the bitwise & (not &&) operator creates an array that
        # is the intersection of two arrays, meaning the common
        # elements. Try this in IRB by creating:
        # array1 = [1,2,3]
        # array2 = [4,5,6]
        # array3 = [1,5,9]
        # then type array1 & array2, array1 & array3, etc

        # This single line test is the equivalent of doing:

        #group.each do |g|
          #groups[i+1].include?(g).should be_false if i < groups.size - 1
        #end
      end
    end
  end
end

def get_students
  [
    "Justin  Belmont",
    "Sushanth  Bhaskarabhatla",
    "Ariel Caplan",
    "Stephanie Chandra",
    "Kevin Chang",
    "Laura Conwill",
    "Morgan  Evans",
    "Daniel  Fenjves",
    "Christopher Guthrie",
    "Dennis  Heihoff",
    "Emma  Ife",
    "Miriam  Jaffe",
    "William Jeffries",
    "Jisu  Kim",
    "Christopher Kohlbrenner",
    "Daniel  Kronovet",
    "Boyoung Kwon",
    "Shira Lazarus",
    "Mike  Lerner",
    "Magdalena Lipinska",
    "George  Mayer",
    "Alisha  McWilliams",
    "Eugene  Millerman",
    "Prashant  Mukhopadhyay",
    "Corbin  Page",
    "Alex  Patriquin",
    "Eric  Peterson",
    "Brian Pisano",
    "Michael Prouty",
    "Sam Schlinkert",
    "Tristan Siegel",
    "Joan  Soskin",
    "Daniel  Spector",
    "Arielle Sullivan",
    "Thomas  Surgent",
    "Pat Whitrock",
    "Alex  Wilkinson",
    "Wontae  Yang",
    "Sunwoo  Yang"
  ]
end