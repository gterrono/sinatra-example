require 'dm-core'
require 'dm-timestamps'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db.db")

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String, :length => 200
  property :keyword, String
  property :created_on, Date
  property :hits, Integer :default => 0
end

DataMapper.auto_migrate!
