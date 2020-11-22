class CreatePlans::V20201116123611 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Plan) do
      primary_key id : Int64
      add_timestamps

      add name : String, unique: true
      add description : String?
      add type : String
      add cost : Int32
    end

    alter table_for(User) do
      add_belongs_to plan : Plan, on_delete: :do_nothing
    end
  end

  def rollback
    alter table_for(User) do
      remove_belongs_to :plan
    end

    drop table_for(Plan)
  end
end
