require "../../../spec_helper"

describe Api::Plans::Delete do
  it "soft deletes a plan" do
    user = UserBox.create
    plan_id = PlanQuery.new.last.id

    response = ApiClient.auth(user).exec(Api::Plans::Delete.with(plan_id))

    response.status_code.should eq(204)
    PlanQuery.new.select_count.should eq(0)
    PlanQuery.new.with_soft_deleted.size.should eq(1)
  end

  it "doesn't delete a plan because the id doesn't exist" do
    user = UserBox.create
    plan_id = 1000 # Doesn't exist.

    response = ApiClient.auth(user).exec(Api::Plans::Delete.with(plan_id))

    response.status_code.should eq(404)
  end

  it "fails if not authenticated" do
    user = UserBox.create
    plan_id = PlanQuery.new.last.id

    response = ApiClient.exec(Api::Plans::Delete.with(plan_id))

    response.status_code.should eq(401)
  end
end
