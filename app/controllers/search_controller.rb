class SearchController < ApplicationController

  def search
    @contants = params[:contants]
    @users_or_books = params[:option]
    @how_search = params[:choice]
    @record = search_for(@contants, @users_or_books, @how_search)

    if @users_or_books == "1"
      @users = @record
    else
      @books = @record
    end
  end

private

  def search_for(contants, users_or_books, how_search)
    if users_or_books == "1"
        if how_search == "1"
                User.where(['name LIKE ?', "%#{contants}%"])
        elsif how_search == "2"
                User.where(['name LIKE ?', "%#{contants}"])
        elsif how_search == "3"
                User.where(['name LIKE ?', "#{contants}%"])
        elsif how_search == "4"
                User.where(['name LIKE ?', "#{contants}"])
        else
                User.all
        end
    elsif users_or_books == "2"
        if how_search == "1"
            Book.where(['title LIKE ?', "%#{contants}%"])
        elsif how_search == "2"
            Book.where(['title LIKE ?', "%#{contants}"])
        elsif how_search == "3"
            Book.where(['title LIKE ?', "#{contants}%"])
        elsif how_search == "4"
            Book.where(['title LIKE ?', "#{contants}"])
        else
            Book.all
        end
     end
  end



end



#   def search
#     @model = params["search"]["model"]
#     @content = params["search"]["content"]
#     @how = params["search"]["how"]
#     @datas = search_for(@how, @model, @content)
#   end

#   private
#   def match(model, content)
#     if model == 'users'
#       User.where(name: content)
#     elsif model == 'books'
#       Book.where(title: content)
#     end
#   end

#   def forward(model, content)
#     if model == 'users'
#       User.where("name LIKE ?", "#{content}%")
#     elsif model == 'books'
#       Book.where("title LIKE ?", "#{content}%")
#     end
#   end

#   def backward(model, content)
#     if model == 'users'
#       User.where("name LIKE ?", "%#{content}")
#     elsif model == 'books'
#       Book.where("title LIKE ?", "%#{content}")
#     end
#   end

#   def partical(model, content)
#     if model == 'users'
#       User.where("name LIKE ?", "%#{content}%")
#     elsif model == 'books'
#       Book.where("title LIKE ?", "%#{content}%")
#     end
#   end

#   def search_for(how, model, content)
#     case how
#     when 'match'
#       match(model, content)
#     when 'forward'
#       forward(model, content)
#     when 'backward'
#       backward(model, content)
#     when 'partical'
#       partical(model, content)
#     end
#   end
# end
