class PlanBox < Avram::Box
  def initialize
    name sequence("Plan")
    description "A billing plan"
    type "standard"
    cost 50
  end
end
