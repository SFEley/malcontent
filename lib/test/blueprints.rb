require "faker"

Sham.content_linkname {Faker::Lorem.words(1).first.downcase}
Sham.content_title {Faker::Company.catch_phrase}
Sham.content_body {Faker::Lorem.paragraph}

Content.blueprint do 
  linkname { Sham.content_linkname }
  title { Sham.content_title }
  body { Sham.content_body }
end
