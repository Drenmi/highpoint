class DonorsFinder
  def initialize(params)
    @sort_column = params[:sort] || "created_at"
    @sort_direction = params[:direction] || "DESC"
    @keyword = params[:search]
    @filter = params[:cause_id]
    @result = Donor.unscoped
  end

  def find_all
    filter
    search
    sort
  end

  private

  def search
    @result = @result.search(@keyword) if @keyword
  end

  def filter
    @result = Cause.find(@filter).donors if @filter.present?
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
