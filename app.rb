require "sinatra"
require "sinatra/reloader" if development?
require "json-schema"

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/' do
    content_type :json
    body = ActiveSupport::JSON.decode(request.body.read)

    # Check the request body schema if matches the format 1
    if JSON::Validator.validate("schemas/format1.json", body, :strict => true)
      body = body["reservation"]
      guest = Guest.find(body["guest_id"])
    # Check the request body schema if matches the format 2
    elsif JSON::Validator.validate("schemas/format2.json", body, :strict => true)
      guest = Guest.find(body["guest"]["id"])
    # Return 422 error if no match for either of the 2 formats
    else
      halt 422, { error: "Invalid request body"}.to_json
    end

    build = build_reservation(body)
    reservation = guest.reservations.create(build)
    reservation.to_json
  end

  def build_reservation(body)
    details = body["guest_details"]
    {
      status: body["status_type"] || body["status"],
      currency: body["host_currency"] || body["currency"],
      nights: body["nights"],
      number_of_guests: body["number_of_guests"] || body["guests"],
      payout: body["expected_payout_amount"] || body["payout_price"],
      security: body["security_price"] || nil,
      total: body["total_paid_amount_accurate"] || body["total_price"],
      description: details ? details["localized_description"] : nil,
      adults: details ? details["number_of_adults"] : body["adults"],
      children: details ? details["number_of_children"] : body["children"],
      infants: details ? details["number_of_infants"] : body["infants"],
      start_date: Date.parse(body["start_date"]),
      end_date: Date.parse(body["end_date"])
    }
  end
end
