class UserSerializer < BaseSerializer
  def initialize(@user : User)
    super(:user, :users)
  end

  def render
    {
      id: @user.id,
      email: @user.email,
      last_billed_date: @user.last_billed_date,
      max_cost: @user.max_cost,
      created_at: @user.created_at,
      updated_at: @user.updated_at
    }
  end

  def render_with_wrapper
    {
      user: render
    }
  end
end
