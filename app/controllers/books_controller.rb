class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # flash[:notice] = 'Книга успешно создана.'
      redirect_to @book
    else
      # flash.now[:alert] = 'Ошибка при создании книги.'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Книга успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Книга успешно удалена.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
