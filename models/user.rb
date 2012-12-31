class User
  include MongoMapper::Document

  key :login, String
  key :response, Array

  # many :responses

  attr_accessible :login, :response
end
