class PlanQuery < Plan::BaseQuery
  include Avram::SoftDelete::Query

  def initialize
    defaults &.only_kept
  end
end
