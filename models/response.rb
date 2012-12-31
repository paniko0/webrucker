class Response
  include MongoMapper::EmbeddedDocument

  key :object, String

  embedded_in :user
end
