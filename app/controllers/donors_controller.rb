class DonorsController < ApplicationController
  # GET donors/:id
  def show
    @donor = find_donor(params[:id])
  end

  private

  def find_donor(id)
    Donor.find(id)
  end
end
