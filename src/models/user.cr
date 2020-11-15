class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
    column last_billed_date : Time?
    column max_cost : Int32
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
