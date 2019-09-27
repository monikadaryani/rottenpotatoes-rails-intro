module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def make_yellow_class(field)
        # if(params[:sort].to_s == field)
            return 'hilite'
        # else
            # return nil
        # end
  end
  #ref : https://stackoverflow.com/questions/18028239/changing-css-properties-of-a-haml-table-from-rails-view
end
