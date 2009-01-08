# Merb::Router is the request routing mapper for the merb framework.
#
# You can route a specific URL to a controller / action pair:
#
#   match("/contact").
#     to(:controller => "info", :action => "contact")
#
# You can define placeholder parts of the url with the :symbol notation. These
# placeholders will be available in the params hash of your controllers. For example:
#
#   match("/books/:book_id/:action").
#     to(:controller => "books")
#   
# Or, use placeholders in the "to" results for more complicated routing, e.g.:
#
#   match("/admin/:module/:controller/:action/:id").
#     to(:controller => ":module/:controller")
#
# You can specify conditions on the placeholder by passing a hash as the second
# argument of "match"
#
#   match("/registration/:course_name", :course_name => /^[a-z]{3,5}-\d{5}$/).
#     to(:controller => "registration")
#
# You can also use regular expressions, deferred routes, and many other options.
# See merb/specs/merb/router.rb for a fairly complete usage sample.

Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  
  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")

  identify(Content => :trail) do    
    match("/(:trail)").to(:controller => "contents") do
      match("(/)contents").to(:action => "index").name(:contents)
      match("/edit").to(:action => "edit").name(:edit_content)
      match("(/)new").to(:action => "new").name(:new_content)
      match("/delete").to(:action => "delete").name(:delete_content)
      match(:method => :put).to(:action => "update").name(:update_content)
      match(:method => :delete).to(:action => "destroy").name(:destroy_content)
      match(:method => :post).to(:action => "create").name(:create_content)
      match(:method => :get).to(:action => "show").name(:content)
    end
    
  end
  
  
end