require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Content do
  describe "basic behavior" do
    before(:each) do
      @content = Content.make_unsaved
    end
      
    it "should be valid" do
      @content.should be_valid
    end
    
    it "should be storable" do
      @content.save.should be_true
    end
    
    it "should require a name" do
      @content.name = nil
      @content.should_not be_valid
    end
    
    it "should require a body" do
      @content.body = nil
      @content.should_not be_valid
    end
    
    it "should default title to name" do
      @content.title = nil
      @content.title.should == @content.name
    end
  end
end