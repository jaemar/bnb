class CreateReservation < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string     :status
      t.string     :currency
      t.string     :description
      t.integer    :nights
      t.integer    :number_of_guests
      t.string     :payout
      t.string     :security
      t.string     :total
      t.integer    :adults, default: 0
      t.integer    :children, default: 0
      t.integer    :infants, default: 0
      t.date       :start_date
      t.date       :end_date
      t.references :guest, foreign_key: true

      t.timestamps
    end
  end
end
