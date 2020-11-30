require "../../../spec_helper"

describe Api::Plans::Create do
  it "creates a plan" do
    user = UserBox.create

    response = ApiClient.auth(user).exec(Api::Plans::Create, plan: valid_params)

    response.should send_json(200,
      plan: {
        id: PlanQuery.last.id,
        name: PlanQuery.last.name,
        description: PlanQuery.last.description,
        type: PlanQuery.last.type,
        cost: PlanQuery.last.cost,
        created_at: PlanQuery.last.created_at,
        updated_at: PlanQuery.last.updated_at
      }
    )
  end

  it "fails if not authenticated" do
    response = ApiClient.exec(Api::Plans::Create)

    response.status_code.should eq(401)
  end
end

private def valid_params
  {
    name: "Test plan",
    description: "A test billing plan",
    type: "custom",
    cost: 500
  }
end
