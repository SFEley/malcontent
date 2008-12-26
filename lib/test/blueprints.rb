require "faker"

Sham.content_name {Faker::Lorem.words(1).first.downcase}
Sham.content_title {Faker::Company.catch_phrase}
Sham.content_body {Faker::Lorem.paragraph}

Content.blueprint do 
  name { Sham.content_name }
  title { Sham.content_title }
  body { Sham.content_body }
end
