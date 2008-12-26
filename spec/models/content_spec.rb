require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Content do
  describe "basic behavior" do
    before(:each) do
      @content = Content.new(ContentTest.bogus)
    end
    
    it "should be initializable" do
      @content.should_not be_nil
    end
  
    it "should be valid" do
      @content.should be_valid
    end
    
    it "should be storable" do
      @content.store.should be_true
    end
  end
end