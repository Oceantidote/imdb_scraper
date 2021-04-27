require_relative "../scraper.rb"

# data for #fetch_movies_url:

describe "#fetch_movie_urls" do
  it "should get the urls for imdb's top 5 movies" do
    actual = fetch_movie_urls
    expected = [
      "http://www.imdb.com/title/tt0111161/",
      "http://www.imdb.com/title/tt0068646/",
      "http://www.imdb.com/title/tt0071562/",
      "http://www.imdb.com/title/tt0468569/",
      "http://www.imdb.com/title/tt0050083/"
    ]
    expect(actual).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "Should return information about a movie as a hash given a url" do
    actual = scrape_movie("http://www.imdb.com/title/tt0468569/")
    expected =  {
        cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
        director: "Christopher Nolan",
        storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        title: "The Dark Knight",
        year: 2008
      }
    expect(actual).to eq(expected)
  end
end


# data for #scrape_movie:

