class AddSoftDeleteToPlans::V20201229190629 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Plan) do
      add soft_deleted_at : Time?
    end
  end

  def rollback
    alter table_for(Plan) do
      remove :soft_deleted_at
    end
  end
end
