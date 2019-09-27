module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def make_yellow(input)
        if(params[:sort_by].to_s == input)
            return 'hilite'
        else
            return nil
        end
  end
end
