require "../../../spec_helper"

describe Api::Plans::Index do
  it "returns the list of plans" do
    user = UserBox.create
    PlanBox.create

    response = ApiClient.auth(user).exec(Api::Plans::Index)

    response.status_code.should eq 200
    response.body.should eq([
        {
          name: PlanQuery.first.name,
          description: "A billing plan",
          type: "standard",
          cost: 50,
          created_at: PlanQuery.first.created_at,
          updated_at: PlanQuery.first.updated_at
        },
        {
          name: PlanQuery.last.name,
          description: "A billing plan",
          type: "standard",
          cost: 50,
          created_at: PlanQuery.last.created_at,
          updated_at: PlanQuery.last.updated_at
        }
      ].to_json
    )
  end

  it "fails if not authenticated" do
    response = ApiClient.exec(Api::Plans::Index)

    response.status_code.should eq(401)
  end
end
