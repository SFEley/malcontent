require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "some content exists" do
  Content.all.destroy!
  3.times {Content.make}
end

describe "Contents controller" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:contents))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of contents" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "some content exists" do
    before(:each) do
      @response = request(resource(:contents))
    end
    
    it "has a list of contents" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Content.all.destroy!
      @response = request(resource(:contents), :method => "POST", 
        :params => { :content => { :id => nil }})
    end
    
    it "redirects to resource(:contents)" do
      @response.should redirect_to(resource(Content.first), :message => {:notice => "content was successfully created"})
    end
    
  end
end

describe "resource(@content)" do 
  describe "a successful DELETE", :given => "some content exists" do
     before(:each) do 
       @response = request(resource(Content.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:contents))
     end

   end
end

describe "resource(:contents, :new)" do
  before(:each) do
    @response = request(resource(:contents, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@content, :edit)", :given => "some content exists" do
  before(:each) do
    @response = request(resource(Content.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@content)", :given => "some content exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Content.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @content = Content.first
      @response = request(resource(@content), :method => "PUT", 
        :params => { :content => {:id => @content.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@content))
    end
  end
  
end

