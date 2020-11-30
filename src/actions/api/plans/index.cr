class Api::Plans::Index < ApiAction
  route do
    plans = PlanQuery.new
    json PlanSerializer.for_collection_with_wrapper(plans)
  end
end
