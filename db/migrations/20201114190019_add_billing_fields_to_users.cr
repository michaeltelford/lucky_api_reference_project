class AddBillingFieldsToUsers::V20201114190019 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add last_billed_date : Time?, default: nil
      add max_cost : Int32, fill_existing_with: 0
    end
  end

  def rollback
    alter table_for(User) do
      remove :last_billed_date
      remove :max_cost
    end
  end
end
