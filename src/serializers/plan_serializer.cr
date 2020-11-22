class PlanSerializer < BaseSerializer
  def initialize(@plan : Plan)
  end

  def render
    {
      name: @plan.name,
      description: @plan.description,
      type: @plan.type,
      cost: @plan.cost,
      created_at: @plan.created_at,
      updated_at: @plan.updated_at
    }
  end
end
