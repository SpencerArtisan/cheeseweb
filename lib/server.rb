require "./lib/init"
require "net/http"

disable :logging
set :root, File.dirname(__FILE__) + "/../"

get "/" do
  send_file "public/index.html"
end

get "/blank" do
  send_file "public/index.html"
end

get "/movies" do
  content_type "application/json"
  Net::HTTP.get(URI.parse('http://glowing-sky-4966.herokuapp.com/films?days=14'))
end

get "/favicon.ico" do
  ""
end

