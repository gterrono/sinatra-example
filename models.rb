require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db.db")

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String, :length => 200, :required => true,
    :messages => {
      :presence => 'A URL is required'
    }
  property :keyword, String, :unique => true, :required => true,
    :messages => {
      :presence => 'A keyword is required',
      :is_unique => 'A URL with that keyword already exists'
    }
  property :created_on, Date
  property :hits, Integer, :default => 0
end

DataMapper.auto_upgrade!
