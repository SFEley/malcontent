class Content
  include DataMapper::Resource
  
  property :id, Serial
  property :linkname, String, :nullable => false
  property :title, String, :nullable => false
  property :body, Text, :nullable => false
  
  
  # For right now this handles the simple, non-hierarchical case of one matching slug.
  def self.retrieve(trail)
    first(:linkname => trail || 'home')
  end
    
  # For right now we'll keep this non-hierarchical and just return the name.
  def trail
    attribute_get(:linkname)
  end
  
  # Seed the tree with a home page if none exists
  def self.create_home
    first_or_create({:linkname => 'home'}, {:title => "Home", 
                :body => "This is the default home page. Please update it."})
  end  
end
