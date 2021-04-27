require_relative "scraper.rb"
require "yaml"
# GET URLS FOR TOP 5 MOVIES

urls = fetch_movie_urls


# SCRAPE MOVIES

movies = urls.map { |url| scrape_movie(url) }



# SAVE MOVIE DATA TO YAML FILE
File.open("movies.yml", "w") do |f|
  f.write(movies.to_yaml)
end
