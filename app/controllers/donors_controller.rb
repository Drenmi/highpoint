class DonorsController < ApplicationController
  # GET donors/:id
  def show
    @donor = find_donor(params[:id])
  end

  # GET /donors
  def index
    @donors = Donor.all
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
end
