class EventsFinder
  def initialize(params)
    @sort_column = params[:sort] || "updated_at"
    @sort_direction = params[:direction] || "DESC"
    @keyword = params[:search]
    @result = Event.unscoped
  end

  def find_all
    search
    sort
  end

  private

  def search
    @result = @result.search(@keyword) if @keyword
  end

  def sort
    if @sort_column == "total_donations"
      if @sort_direction == "ASC"
        @result.sort_by(&:total_donations)
      else
        @result.sort_by(&:total_donations).reverse
      end
    else
      @result.order(@sort_column + " " + @sort_direction)
    end
  end
end
