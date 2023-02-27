module GenreConcern
  private 
  def fetch_all_genres
    artists = Genre.where(deleted: false).order(title: :asc)
  end
end