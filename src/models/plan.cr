class Plan < BaseModel
  table do
    has_many users : User

    column name : String
    column description : String?
    column type : String
    column cost : Int32
  end
end
