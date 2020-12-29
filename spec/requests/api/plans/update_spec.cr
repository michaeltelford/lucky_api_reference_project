require "../../../spec_helper"

describe Api::Plans::Update do
  it "updates a plan" do
    user = UserBox.create
    plan_id = PlanQuery.new.last.id

    response = ApiClient.auth(user).exec(Api::Plans::Update.with(plan_id), plan: valid_params)

    response.should send_json(200,
      plan: {
        id: PlanQuery.last.id,
        name: valid_params[:name],
        description: valid_params[:description],
        type: valid_params[:type],
        cost: valid_params[:cost],
        created_at: PlanQuery.last.created_at,
        updated_at: PlanQuery.last.updated_at
      }
    )
  end

  it "doesn't update a plan because the id doesn't exist" do
    user = UserBox.create
    plan_id = 1000 # Doesn't exist.

    response = ApiClient.auth(user).exec(Api::Plans::Update.with(plan_id), plan: valid_params)

    response.status_code.should eq(404)
  end

  it "fails if not authenticated" do
    user = UserBox.create
    plan_id = PlanQuery.new.last.id

    response = ApiClient.exec(Api::Plans::Update.with(plan_id))

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
