class Film < Product

  def update(params)
    @title = params[:title]
    @genre = params[:genre]
    @year = params[:year]
    @producer = params[:producer]

    end
  def info
    "Название фильма \"#{@title}\",#{@year} года выпуска, жанр #{@genre}, режиссер - \"#{@producer}\" "
  end

end