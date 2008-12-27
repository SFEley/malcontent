require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "some content exists" do
  Content.all.destroy!
  3.times {Content.make}
end

describe "Contents" do
  
  describe "index", :given => "some content exists" do
    before(:each) do
      @response = request(url(:contents))
    end
    
    it "has a list of contents" do
      @response.should have_xpath("//ul[count(./li)=3]")
    end
  end
  
  describe "create" do
    before(:each) do
      Content.all.destroy!
      @content = Content.make_unsaved
      @response = request(url(:contents), :method => "POST", 
        :params => { :content => @content.attributes })
    end
    
    it "redirects to the content page" do
      @response.should redirect_to(url(:content, @content), :message => {:notice => "content was successfully created"})
    end
    
  end

  describe "destroy", :given => "some content exists" do
     before(:each) do 
       @response = request(resource(Content.first), :method => "DELETE")
     end

     it "redirects to the index" do
       @response.should redirect_to(resource(:contents))
     end
     
     it "leaves one less record" do
       request(url(:contents)).should have_xpath("//ul[count(./li)=2]")
      end

  end

  describe "new" do
    before(:each) do
      @response = request(url(:new_content))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
    
    it "contains a form that posts to contents" do
      @response.should have_xpath("//form[@action='#{url(:contents)}']")
    end
    
    it "contains a name field" do
      @response.should have_xpath("//form//input[@name='content[name]']")
    end
    
    it "contains a title field" do
      @response.should have_xpath("//form//input[@name='content[title]']")
    end
    
    it "contains a body area" do
      @response.should have_xpath("//form//textarea[@name='content[body]']")
    end
  end

  describe "edit", :given => "some content exists" do
    before(:each) do
      @response = request(resource(Content.first, :edit))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
    it "contains a form that posts to contents" do
      @response.should have_xpath("//form[@action='#{url(:contents)}']")
    end
    
    it "does not contain a name field" do
      @response.should_not have_xpath("//form//input[@name='content[name]']")
    end
    
    it "contains a title field" do
      @response.should have_xpath("//form//input[@name='content[title]']")
    end
    
    it "contains a body area" do
      @response.should have_xpath("//form//textarea[@name='content[body]']")
    end
  end

  describe "show", :given => "some content exists" do
    before(:each) do
      @response = request(url(:content, Content.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "update", :given => "some content exists" do
    before(:each) do
      @content = Content.first
      @response = request(resource(Content.first), :method => "PUT", 
        :params => { :content => {:id => @content.id, :title => "New title"} })
    end

    it "redirects to the content page" do
      @response.should redirect_to(url(:content, @content))
    end
  end

end