class User
  include MongoMapper::Document

  key :login, String
  key :datetime, DateTime
  key :response, Array

  # many :responses

  attr_accessible :login, :datetime, :response
end
