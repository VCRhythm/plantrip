class AddTripIdToDay < ActiveRecord::Migration
  def change
    add_reference :days, :trip, index: true
  end
end
