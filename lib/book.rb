class Book < Product

  def update(params)
    @title = params[:title]
    @author_name = params[:author_name]
  end

  def info
    "Название книги \"#{@title}\", автор - \"#{@author_name}\" "
  end

end