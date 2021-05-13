# models/reservation.rb
require 'active_record'

class Reservation < ActiveRecord::Base
  belongs_to :guest, foreign_key: :guest_id
end
