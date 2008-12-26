class Content
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String, :nullable => false
  property :title, String
  property :body, Text, :nullable => false
  
  # If the title isn't set, it should default to the name (which is required)
  def title
    attribute_get(:title) || attribute_get(:name)
  end

end
