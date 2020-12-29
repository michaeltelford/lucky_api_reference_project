class UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def self.collection_key
    "users"
  end

  def self.object_key
    "user"
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
end
