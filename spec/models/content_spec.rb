require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Content do
  describe "when validating" do
    before(:each) do
      @content = Content.make_unsaved
    end
      
    it "should be valid" do
      @content.should be_valid
    end
    
    it "should be storable" do
      @content.save.should be_true
    end
    
    it "should require a link" do
      @content.linkname = nil
      @content.should_not be_valid
    end
    
    it "should require a title" do
      @content.title = nil
      @content.should_not be_valid
    end
    
    it "should require a body" do
      @content.body = nil
      @content.should_not be_valid
    end
  end
  
  describe "trails" do
    before(:each) do
      @this = Content.make
    end

    it "should end with the link name" do
      @this.trail.should match(/#{@this.linkname}$/)
    end
  
    it "should retrieve the correct top-level record" do
      Content.retrieve(@this.linkname).should == @this
    end
    
    it "should default to 'home' when blank" do
      @home = Content.make(:linkname => 'home')
      Content.retrieve(nil).should == @home
    end
    
    describe "when nested" 
    
  end
end