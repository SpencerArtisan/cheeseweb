require "./lib/init"
require "net/http"

#disable :logging
set :root, File.dirname(__FILE__) + "/../"

get "/" do
  send_file "public/index.html"
end

get "/blank" do
  send_file "public/index.html"
end

get "/movies" do
  content_type "application/json"
#  '[{"name" : "The Bourne Ultimatum", "rating" : 8.1, "channel" : "ITV 2", "start" : "2012-07-06 20:00", "end" : "2012-07-06 22:15", "image" : "http://ia.media-imdb.com/images/M/MV5BMTgzNjMwOTM3N15BMl5BanBnXkFtZTcwMzA5MDY0MQ@@.jpg"}]'

  Net::HTTP.get(URI.parse('http://glowing-sky-4966.herokuapp.com/films?days=14'))
end

get "/favicon.ico" do
  ""
end

