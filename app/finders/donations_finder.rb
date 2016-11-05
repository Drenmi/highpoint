class DonationsFinder
  def initialize(params, event)
    @sort_column = params[:sort] || "created_at"
    @sort_direction = params[:direction] || "DESC"
    @keyword = params[:search]
    @event = event
    @result = @event.donations
  end

  def find_all
    if @event.donations.present?
      search
      sort
    else
      @result
    end
  end

  private

  def search
    @result = @result.search(@keyword) if @keyword
  end

  def sort
    if @sort_column == "donor_name"
      if @sort_direction == "ASC"
        @result.joins(:donor).order("donors.name")
      else
        @result.joins(:donor).order("donors.name").reverse
      end
    else
      @result.order(@sort_column + " " + @sort_direction)
    end
  end
end
