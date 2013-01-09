class User
  include Mongoid::Document

  field :login, type: String
  field :datetime, type: DateTime
  field :response, type: Array

  # many :responses

  attr_accessible :login, :datetime, :response
end
