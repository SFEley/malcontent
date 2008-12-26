# The big kahuna of the Malcontent CMS system.  The Content class implements retrieval
# and creation methods at a high level; it's up to individual strategies to determine how
# they're implemented.
class Content
  def initialize(*fields)
    opts = extract_options_from_args!(fields) || {}
    @title = opts[:title]
  end
end
