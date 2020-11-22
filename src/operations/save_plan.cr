class SavePlan < Plan::SaveOperation
  permit_columns name, description, type, cost

  before_save do
    validate_required name, type, cost
    validate_uniqueness_of name, query: PlanQuery.new.name.lower
    validate_inclusion_of type, in: ["standard", "custom"]
  end
end
