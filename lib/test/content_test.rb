# High-level test methods for the content system.  Putting them in /lib because 
# they'll be used by both RSpec and Cucumber.

require 'rubygems'
require 'machinist'
require 'faker'

Sham.content_name {Faker::Lorem.words(1)}
Sham.content_title {Faker::Company.catch_phrase}
Sham.content_body {Faker::Lorem.paragraphs}

module ContentTest
  module ClassMethods
    def clear_content
      self.all_content.each {|c| c.destroy!}
    end
  
    def fake_content(*fields)
      bogus = {
        :name => Sham.content_name,
        :title => Sham.content_title,
        :body => Sham.content_body
      }
      self.create(bogus.merge(fields))
    end
  end
  
  def self.included(klass)
    klass.extend(ClassMethods)
  end
end

class Content
  include ContentTest
end