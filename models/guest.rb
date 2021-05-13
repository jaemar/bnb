# models/guest.rb
require 'active_record'

class Guest < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
end
