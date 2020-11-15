class UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def render
    {
      email: @user.email,
      last_billed_date: @user.last_billed_date,
      max_cost: @user.max_cost
    }
  end
end
