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
  end

  def new
    only_provides :html
    @content = Content.new
    display @content
  end

  def edit(id)
    only_provides :html
    @content = Content.get(id)
    raise NotFound unless @content
    display @content
  end

  def create(content)
    @content = Content.new(content)
    if @content.save
      redirect resource(@content), :message => {:notice => "Content was successfully created"}
    else
      message[:error] = "Content failed to be created"
      render :new
    end
  end

  def update(id, content)
    @content = Content.get(id)
    raise NotFound unless @content
    if @content.update_attributes(content)
       redirect resource(@content)
    else
      display @content, :edit
    end
  end

  def destroy(id)
    @content = Content.get(id)
    raise NotFound unless @content
    if @content.destroy
      redirect resource(:contents)
    else
      raise InternalServerError
    end
  end

end # Contents
