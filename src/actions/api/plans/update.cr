class Api::Plans::Update < ApiAction
  route do
    plan = SavePlan.update!(PlanQuery.new.find(plan_id), params)
    json PlanSerializer.new(plan).render_with_wrapper
  end
end
