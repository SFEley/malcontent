require File.join( File.dirname(__FILE__), 'merb_rspec' ) 
require "autotest/cucumber_mixin"
class Autotest::CucumberMerbRspec < Autotest::MerbRspec
  include CucumberMixin
  def cucumber
    `which cucumber`.chomp
  end
  
  # def get_to_green
  #   begin
  #     super until super.all_good
  #     run_features
  #     wait_for_changes unless all_features_good
  #   end until all_features_good
  # end
end
