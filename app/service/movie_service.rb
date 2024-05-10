class MovieService 

  def top_rated_movies 
    get_url("/3/movie/top_rated?language=en-US&page=1")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symboliz_names: true)
  end
   
  def conn 
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|

      faraday.headers["Authorization"] = "Bearer #{Rails.application.credentials.movies[:key]}" 
    end
  end
end