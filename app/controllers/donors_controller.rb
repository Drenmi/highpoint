class DonorsController < ApplicationController
  # GET donors/:id
  def show
    @donor = find_donor(params[:id])
  end

  # GET /donors
  def index
    @donors = if params[:total_donations] == "asc"
                searched_donors.sort_by(&:total_donations)
              elsif params[:total_donations] == "desc"
                searched_donors.sort_by(&:total_donations).reverse
              else
                searched_donors
              end
  end

  def update
    @donor = find_donor(params[:id])

    if @donor.update(donor_params)
      redirect_to @donor
    else
      redirect_to :edit
    end
  end

  def edit
    @donor = find_donor(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def find_donor(id)
    Donor.find(id)
  end

  def donor_params
    params.require(:donor).permit(:name, :phone_number, :email_address, :address)
  end

  def filtered_donors
    if params[:cause_id].present?
      Cause.find(params[:cause_id]).donors
    else
      Donor.all
    end
  end

  def searched_donors
    if params[:search]
      filtered_donors.search(params[:search])
    else
      filtered_donors
    end
  end
end
