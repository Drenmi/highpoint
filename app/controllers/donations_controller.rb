class DonationsController < ApplicationController
  # POST /donations
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to donations_path, notice: "Donation was successfully created."
    else
      redirect_to donations_path, error: "Failed to save donation."
    end
  end

  def update
    @donation = find_donation(params[:id])
    if @donation.update(donation_params)
      redirect_to donor_path(@donation.donor), notice: "Donation was successfully updated."
    else
      redirect_to donor_path(@donation.donor), error: "Failed to update donation."
    end
  end

  def edit
    @donation = find_donation(params[:id])
    render :edit
  end

  private

  def find_donation(id)
    Donation.find(id)
  end

  def donation_params
    params.require(:donation).permit(:amount, :cause_id, :event_id)
  end
end
