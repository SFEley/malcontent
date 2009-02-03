class Contents < Application
  # provides :xml, :yaml, :js

  def index
    @contents = Content.all
    display @contents
  end

  def show(trail)    
    @content = Content.retrieve(trail)
    raise NotFound unless @content
    display @content
    
  rescue NotFound
    # Handle the very exceptional case of no home page
    if trail.blank?
      display @content = Content.create_home
    else
      raise
    end
  end

  def new
    only_provides :html
    @content = Content.new
    display @content
  end

  def edit(trail)
    only_provides :html
    @content = Content.retrieve(trail)
    raise NotFound unless @content
    display @content
  end
  
  def delete(trail)
    only_provides :html
    @content = Content.retrieve(trail)
    raise NotFound unless @content
    display @content
  end

  def create(content)
    @content = Content.new(content)
    if @content.save
      redirect url(:content, @content), :message => "Page created."
    else
      message[:error] = "Content failed to be created"
      render :new
    end
  end

  def update(trail, content)
    @content = Content.retrieve(trail)
    raise NotFound unless @content
    if @content.update_attributes(content)
       redirect url(:content, @content), :message => "Page updated."
    else
      display @content, :edit
    end
  end

  def destroy(trail)
    @content = Content.retrieve(trail)
    raise NotFound unless @content
    if @content.destroy
      redirect url(:contents), :message => "Page destroyed!"
    else
      raise InternalServerError
    end
  end

end # Contents
