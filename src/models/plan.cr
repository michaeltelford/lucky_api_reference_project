class Plan < BaseModel
  include Avram::SoftDelete::Model

  table do
    has_many users : User

    column name : String
    column description : String?
    column type : String
    column cost : Int32
    column soft_deleted_at : Time?
  end
end
