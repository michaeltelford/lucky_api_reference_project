class Api::Plans::Index < ApiAction
  route do
    pages, plans = paginate(PlanQuery.new)
    json PlanSerializer.for_collection(pages, plans)
  end
end
