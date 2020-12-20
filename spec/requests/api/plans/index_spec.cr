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

  it "returns a paginated list of plans" do
    user = UserBox.create
    PlanBox.create_pair
    PlanBox.create_pair

    third_plan = PlanQuery.new.find(3)
    fourth_plan = PlanQuery.new.find(4)

    response = ApiClient.auth(user).exec(Api::Plans::Index.with(page: 2, size: 2))

    response.should send_json(200,
      plans: [
        {
          id: third_plan.id,
          name: third_plan.name,
          description: third_plan.description,
          type: third_plan.type,
          cost: third_plan.cost,
          created_at: third_plan.created_at,
          updated_at: third_plan.updated_at
        },
        {
          id: fourth_plan.id,
          name: fourth_plan.name,
          description: fourth_plan.description,
          type: fourth_plan.type,
          cost: fourth_plan.cost,
          created_at: fourth_plan.created_at,
          updated_at: fourth_plan.updated_at
        }
      ],
      pagination: {
        next_page: "/api/plans?page=3&size=2",
        previous_page: "/api/plans?page=1&size=2",
        total_items: 5,
        total_pages: 3
      }
    )
  end

  it "fails if not authenticated" do
    response = ApiClient.exec(Api::Plans::Index)

    response.status_code.should eq(401)
  end
end
