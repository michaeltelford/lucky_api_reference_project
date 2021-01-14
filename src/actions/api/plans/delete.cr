class Api::Plans::Delete < ApiAction
  route do
    PlanQuery.new.find(plan_id).soft_delete
    head 204
  end
end
