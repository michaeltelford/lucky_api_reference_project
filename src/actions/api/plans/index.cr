class Api::Plans::Index < ApiAction
  route do
    plans = PlanQuery.new
    json PlanSerializer.for_collection(plans)
  end
end
