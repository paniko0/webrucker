MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'webrucker_development'
  when :production  then MongoMapper.database = 'webrucker_production'
  when :test        then MongoMapper.database = 'webrucker_test'
end
