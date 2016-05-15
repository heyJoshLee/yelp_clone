class AddStateZipCodeAndPhoneNumberToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :phone_number, :string
    add_column :businesses, :state_code, :string
    add_column :businesses, :zip_code, :string
  end
end
