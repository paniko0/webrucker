class User
  include MongoMapper::Document

  key :login, String
  key :datetime, String
  key :response, Array

  # many :responses

  attr_accessible :login, :datetime, :response
end
