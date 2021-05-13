class CreateGuest < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string  :email
      t.string  :first_name
      t.string  :last_name
      t.string  :phone_number, array: true, default: []

      t.timestamps
    end
  end
end
