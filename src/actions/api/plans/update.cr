class Api::Plans::Update < ApiAction
  route do
    plan = SavePlan.update!(PlanQuery.new.find(plan_id), params)
    json PlanSerializer.for_object(plan)
  end
end
