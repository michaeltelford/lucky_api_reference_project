class Api::Plans::Index < ApiAction
  route do
    pages, plans = paginate(PlanQuery.new)
    json PlanSerializer.for_collection_with_wrapper(pages, plans)
  end
end
