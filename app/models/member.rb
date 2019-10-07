class Member
  attr_reader :name, :role, :party, :district, :seniority

  def initialize(member)
    @name = member[:name]
    @role = member[:role]
    @party = member[:party]
    @district = member[:district]
    @seniority = member[:seniority]
  end
end
