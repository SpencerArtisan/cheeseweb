movieData = [
    {"title":  "Birdemic", "rating": 1.2},
    {"title":  "The Godfather", "rating": 9.2}
]

describe "Movie", ->
    it "creates from data", ->
        @movie = new Movie(movieData[1])
        expect(@movie.get('title')).toEqual('The Godfather')

describe "Movies", ->
    it 'orders by rating, highest first', ->
      @movies = new Movies(movieData)
      expect(@movies.models[0].get('title')).toEqual('The Godfather')
      expect(@movies.models[1].get('title')).toEqual('Birdemic')


