class User
  include Mongoid::Document

  field :login, type: String
  field :received_date, type: DateTime
  field :response, type: Array

  # many :responses

  attr_accessible :login, :received_date, :response
end