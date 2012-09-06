require 'sinatra'
require 'sinatra/reloader' if development?
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

get '/:keyword' do
  link = Link.first(:keyword => params[:keyword])
  if link
    link.update(:hits => link.hits + 1)
    redirect link.url
  else
    404
  end
end

not_found do
  'this is not the page you were looking for...'
end
