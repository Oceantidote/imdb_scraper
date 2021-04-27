require "nokogiri"
require "open-uri"
require "pry-byebug"

# doc = Nokogiri::HTML(open(url).read)
# STUFF = doc.search("CSS SELECTORS")


def fetch_movie_urls
  url = "https://www.imdb.com/chart/top"
  doc = Nokogiri::HTML(open(url).read)
  movies = doc.search(".titleColumn a")[0...5]
  movies.map do |movie_link|
    end_url = movie_link.attribute("href").value
    "http://www.imdb.com#{end_url}"

  end

end



def scrape_movie(url)
  result = {}
  doc = Nokogiri::HTML(open(url).read)
  result[:title] = doc.search("h1").text.split("(")[0][0..-2]
  result[:year] = doc.search("h1").text.split("(")[1].match(/\d*/)[0].to_i
  result[:director] = doc.search(".credit_summary_item a")[0].text
  result[:storyline] = doc.search(".summary_text").text.strip
  stars_unclean = doc.search(".credit_summary_item")[2].children.map do |child|
    child.text.strip if child.text.strip.length > 6
  end
  result[:cast] = stars_unclean.compact[0..2]
  result
end

p scrape_movie("http://www.imdb.com/title/tt0468569/")

# title: "The Dark Knight",
# year: 2008
# cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
# director: "Christopher Nolan",
# storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
