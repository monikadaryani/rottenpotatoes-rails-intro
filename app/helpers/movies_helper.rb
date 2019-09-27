module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def make_yellow_class(field)
        if(params[:sort].to_s == field)
            return 'hilite'
        else
            return nil
        end
  end
end
