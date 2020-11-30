require "../../../spec_helper"

describe Api::Me::Show do
  it "returns the signed in user" do
    now = Time.local
    user = UserBox.create &.last_billed_date(now)

    response = ApiClient.auth(user).exec(Api::Me::Show)

    response.should send_json(200,
      user: {
        id: user.id,
        email: user.email,
        last_billed_date: now.to_utc,
        max_cost: 100,
        created_at: user.created_at,
        updated_at: user.updated_at
      }
    )
  end

  it "fails if not authenticated" do
    response = ApiClient.exec(Api::Me::Show)

    response.status_code.should eq(401)
  end
end
