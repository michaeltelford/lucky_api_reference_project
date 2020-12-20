class BaseSerializer < Lucky::Serializer
  include Lucky::TextHelpers

  @@wrapper : String = ""
  @@pluralized_wrapper : String = ""

  def initialize(wrapper = "data")
    @@wrapper = wrapper
    @@pluralized_wrapper = pluralize(nil, wrapper).split(" ").last
  end

  def render_with_wrapper
    {
      @@wrapper => render
    }
  end

  def self.for_collection(collection : Enumerable, *args, **named_args)
    collection.map { |object| new(object, *args, **named_args) }
  end

  def self.for_collection_with_wrapper(collection : Enumerable, *args, **named_args)
    {
      @@pluralized_wrapper => for_collection(collection, *args, **named_args)
    }
  end

  def self.for_collection_with_wrapper(
    pages : Lucky::Paginator, collection : Enumerable, *args, **named_args
  )
    {
      @@pluralized_wrapper => for_collection(collection, *args, **named_args),
      :pagination => {
        next_page: pages.path_to_next,
        previous_page: pages.path_to_previous,
        total_items: pages.item_count,
        total_pages: pages.total
      }
    }
  end
end
