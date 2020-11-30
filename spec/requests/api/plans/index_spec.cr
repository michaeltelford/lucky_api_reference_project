require "../../../spec_helper"

describe Api::Plans::Index do
  it "returns the list of plans" do
    user = UserBox.create
    PlanBox.create

    response = ApiClient.auth(user).exec(Api::Plans::Index)

    response.should send_json(200,
      plans: [
        {
          id: PlanQuery.first.id,
          name: PlanQuery.first.name,
          description: PlanQuery.first.description,
          type: PlanQuery.first.type,
          cost: PlanQuery.first.cost,
          created_at: PlanQuery.first.created_at,
          updated_at: PlanQuery.first.updated_at
        },
        {
          id: PlanQuery.last.id,
          name: PlanQuery.last.name,
          description: PlanQuery.last.description,
          type: PlanQuery.last.type,
          cost: PlanQuery.last.cost,
          created_at: PlanQuery.last.created_at,
          updated_at: PlanQuery.last.updated_at
        }
      ]
    )
  end

  it "fails if not authenticated" do
    response = ApiClient.exec(Api::Plans::Index)

    response.status_code.should eq(401)
  end
end
