require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require_relative 'helpers.rb'
require_relative 'models'

get '/' do
  erb :index
end

post '/' do
  link = Link.create(params)
  if link.saved?
    redirect "/link/#{link.keyword}"
  else
    @has_errors = true
    @entered_data = params
    @url_error = link.errors[:url][0]
    @keyword_error = link.errors[:keyword][0]
    erb :index
  end
end

get '/links' do
  @links = Link.all
  erb :links
end

get '/about' do
  erb :about
end

get '/:keyword' do
  ensure_link_exists(params[:keyword]) do |link|
    link.update(:hits => link.hits + 1)
    redirect link.url
  end
end

get '/link/:keyword' do
  ensure_link_exists(params[:keyword]) do |link|
    erb :link, :locals => {:link => link, :host => request.host, :port => request.port}
  end
end

not_found do
  erb 'This page does not exist'
end
