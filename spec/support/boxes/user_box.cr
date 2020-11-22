class UserBox < Avram::Box
  def initialize
    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    last_billed_date Time.local
    max_cost 100
    plan_id PlanBox.create.id
  end
end
