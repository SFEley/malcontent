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

  # For right now this handles the simple, non-hierarchical case of one matching name.
  def self.retrieve(trail)
    first(:name => trail)
  end
    
  # For right now we'll keep this non-hierarchical and just return the name.
  def trail
    attribute_get(:name)
  end
end
