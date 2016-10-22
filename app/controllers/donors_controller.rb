class DonorsController < ApplicationController
  # GET donors/:id
  def show
    @donor = find_donor(params[:id])
  end

  # GET /donors
  def index
    @donors = if params[:search]
                Donor.search(params[:search])
              else
                Donor.all
              end
    @donors = @donors.includes(:donations).where("donations.cause_id = ?", params[:cause_id]).references(:donations) if params[:cause_id].present?
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
    params.require(:donor).permit(:name, :phone_number, :email_address, :address, donations: [:cause_id])
  end
end
