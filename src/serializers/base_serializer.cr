alias Entity     = Hash(String, BaseSerializer)
alias Pagination = Hash(String, Int32 | Int64 | String | Nil)
alias Collection = Hash(String, Array(BaseSerializer) | Pagination)

abstract class BaseSerializer < Lucky::Serializer
  # Default collection keys if none is defined in a child class.
  def self.object_key : String
    "data"
  end

  def self.collection_key : String
    "data"
  end

  def self.for_object(object : BaseModel, *args, **named_args) : Entity
    Entity{self.object_key => new(object, *args, **named_args)}
  end

  def self.for_collection(collection : Enumerable, *args, **named_args) : Collection
    # Init array of BaseSerializer because covariance isn't fully supported in Crystal.
    entities = [] of BaseSerializer
    collection.each { |object| entities << new(object, *args, **named_args) }
    Collection{self.collection_key => entities}
  end

  def self.for_collection(
    pages : Lucky::Paginator, collection : Enumerable, *args, **named_args
  ) : Collection
    pagination = Pagination{
      "next_page" => pages.path_to_next,
      "previous_page" => pages.path_to_previous,
      "total_items" => pages.item_count,
      "total_pages" => pages.total
    }
    for_collection(collection, *args, **named_args).merge({"pagination" => pagination})
  end
end
