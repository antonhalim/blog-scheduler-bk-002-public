describe "Blog Post Scheduler" do

  describe "#create_groups" do
    # A bit about this let method below (http://betterspecs.org/#let)
    # `let` will create a method named after the argument
    # that will execute the associated block every time
    # it is called. It is a semantic way to define
    # subjects for your tests.

    # tl;dr - you call group_size in your test, it returns 4
    #       - you call tota_days in your test, it returns 20
    #       - you call students in your test, it returns an array of strings:
    #         ["Justin  Belmont", "Sushanth  Bhaskarabhatla"...]

    let(:group_size) { 4 }
    let(:twenty_days) { 20 }
    let(:students)   { YAML.load_file('spec/support/students.yml') }

    it "returns an array of groups" do
      expect(create_groups(students, group_size, twenty_days).class).to eq(Array)
    end

    it "sets group sizes to the size given" do
      expect(create_groups(students, group_size, twenty_days).first.size).to eq(group_size)
    end

    it "creates the right number of groups" do
      expect(create_groups(students, group_size, twenty_days).size).to eq(twenty_days)
    end

    it "uses every student in the list for a large enough number of groups" do
      eleven_days = 11
      groups = create_groups(students, group_size, eleven_days)
      expect(groups.flatten.uniq.sort).to eq(students.sort)
    end

    it "attempts to randomize the list" do
        expect(create_groups(students, group_size, twenty_days)).not_to eq(students)
    end

    it "uses some students more than once for a large enough number of groups" do
      almost_three_years = 1000
      groups = create_groups(students, group_size, almost_three_years)
      groups.each do |group|
        expect(group.size).to eq(group_size)
      end
    end

    it "doesn't repeat students on adjacent days" do
      groups = create_groups(students, group_size, twenty_days)
      groups.each_with_index do |group, i|
        expect((group & groups[i+1])).to eq([]) if i < groups.size - 1
      end
    end
  end
end
