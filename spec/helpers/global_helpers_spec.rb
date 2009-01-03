require File.dirname(__FILE__) + '/../spec_helper'

describe "Global helpers" do
  include Merb::GlobalHelpers
  
  describe "styled message" do
    it "should return nothing if there is no message" do
      @message = nil
      styled_message.should be_nil
    end
    
    describe "with string-style messages" do
      before(:all) do
        @message = "This is a test message."
      end

      it "should return a #flash element" do
        styled_message.should have_xpath("/[id='flash']")
      end
      
      it "should contain a .notice with the string" do
        styled_message.should have_xpath("//[class='notice' text()='This is a test message.']")
      end
    end
    
    describe "with hash-style messages" do
      before(:all) do
        @message = {
          :notice => "A notice.",
          :error => "An error."
        }
      end
      
      it "should return a #flash element" do
        styled_message.should have_xpath("[/id='flash']")        
      end
      
      it "should contain a .notice with the notice text" do
        styled_message.should have_xpath("//[class='notice' text()='A notice.']")
      end
      
      it "should contain an .error with the error text" do
        styled_message.should have_xpath("//[class='error' text()='An error.']")
      end
    end
    
  end
  
end
