class Disc < Product

  def update(params)
    @title = params[:title]
    @genre = params[:genre]
    @year = params[:year]
    @producer = params[:producer]

  end
  def info
    "Название диска \"#{@title}\",#{@year} года выпуска, жанр #{@genre}, музыкант - \"#{@producer}\" "
  end

end