require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db.db")
DataMapper::Property::Float.default(0.0)

DataMapper.auto_migrate!
