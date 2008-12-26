# High-level test methods for the content system.  Putting them in /lib because 
# they'll be used by both RSpec and Cucumber.

require 'rubygems'
require 'faker'

module ContentTest
  
  def self.bogus(*fields)
    {
      :name => Faker::Lorem.words(1).first.downcase,
      :title => Faker::Company.catch_phrase,
      :body => Faker::Lorem.paragraphs
    }.merge(fields)
  end
  
  module ClassMethods
    def clear_content
      self.all_content.each {|c| c.destroy!}
    end
  
    def fake_content(*fields)
      self.create(ContentTest.bogus(fields))
    end
  end
  
  def self.included(klass)
    klass.extend(ClassMethods)
  end
end

class Content
  include ContentTest
end