# MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

# case Padrino.env
#   when :development then MongoMapper.database = 'webrucker_development'
#   when :production  then MongoMapper.database = 'webrucker_production'
#   when :test        then MongoMapper.database = 'webrucker_test'
# end

if ENV['MONGOHQ_URL']
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'], :logger => logger)
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('127.0.0.1', nil, :logger => logger)
  MongoMapper.database = "webrucker_#{Padrino.env}"
end
