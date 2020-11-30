class Api::Plans::Create < ApiAction
  route do
    plan = SavePlan.create!(params)
    json PlanSerializer.new(plan).render_with_wrapper
  end
end
