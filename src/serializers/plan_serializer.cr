class PlanSerializer < BaseSerializer
  def initialize(@plan : Plan)
  end

  def self.collection_key
    "plans"
  end

  def self.object_key
    "plan"
  end

  def render
    {
      id: @plan.id,
      name: @plan.name,
      description: @plan.description,
      type: @plan.type,
      cost: @plan.cost,
      created_at: @plan.created_at,
      updated_at: @plan.updated_at
    }
  end
end
