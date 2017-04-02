require "csv"

task import_donations: :environment do
  i = 0
  CSV.foreach("db/data/donations_2009_2015.csv", headers: false) do |row|
    i = i + 1

    next if i == 1

    begin
      row.each { |r| r.to_s.strip! }

      puts '----------------------'

      _, id, title, name, _, address1, address2, address3,
        postal_code, email_address, phone_number, payment_type,
        _, donation_date, _, amount, *_, _, _, _ = *row

      puts "id: #{id}",
           "title: #{title}",
           "name: #{name}",
           "address1: #{address1}",
           "address2: #{address2}",
           "address3: #{address3}",
           "postal code: #{postal_code}",
           "email address: #{email_address}",
           "phone number: #{phone_number}",
           "payment type: #{payment_type}",
           "donation date: #{donation_date}",
           "amount: #{amount}"

      address = [address1, address2, address3].join("\n")

      donor =
        if name != "Anonymous"
          if id.present?
            d = Donor.find_or_create_by!(identification: id)
            d.update(title: title, name: name, address: address,
                     postal_code: postal_code, email_address: email_address,
                     phone_number: phone_number)
            d
          else
            d = Donor.find_or_create_by!(name: name)
            d.update(title: title, address: address,
                     postal_code: postal_code, email_address: email_address,
                     phone_number: phone_number)
            d
          end
        else
          Donor.find_by(name: "Anonymous")
        end

      date_parts = donation_date.split("/").map(&:to_i).reverse
      donated_at = Date.new(*date_parts)
      payment_type = payment_type.to_s.downcase.gsub(' ', '_').to_sym.presence || :other

      Donation.create!(amount: amount, payment_type: payment_type, created_at: donated_at, donor: donor)

    rescue Exception => e
      puts i, e
      break
    end
  end
end
