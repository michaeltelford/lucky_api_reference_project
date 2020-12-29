class Api::Plans::Create < ApiAction
  route do
    plan = SavePlan.create!(params)
    json PlanSerializer.for_object(plan)
  end
end
