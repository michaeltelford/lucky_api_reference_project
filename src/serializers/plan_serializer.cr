class PlanSerializer < BaseSerializer
  def initialize(@plan : Plan)
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

  def render_with_wrapper
    {
      plan: render
    }
  end

  def self.for_collection_with_wrapper(collection : Enumerable, *args, **named_args)
    {
      plans: for_collection(collection, *args, **named_args)
    }
  end
end
