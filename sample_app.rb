require 'sinatra'
require_relative 'models'

get '/' do
  erb :index
end

post '/' do
  link = Link.create(params)
  if link.saved?
    'Your link was saved'
  else
    @entered_data = params
    @error = link.errors.first[0]
    erb :index
  end
end
