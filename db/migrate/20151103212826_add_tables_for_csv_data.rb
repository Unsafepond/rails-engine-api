class AddTablesForCsvData < ActiveRecord::Migration
  def change
  	create_table :customers do |t|
  		t.string :first_name
  		t.string :last_name

  		t.timestamps null: false
  	end

  	create_table :invoice_items do |t|
  		t.integer :item_id
  		t.integer :invoice_id
  		t.integer :quantity
  		t.integer :unit_price

  		t.timestamps null: false
  	end

  	create_table :invoices do |t|
  		t.integer :customer_id
  		t.integer :merchant_id
  		t.string :status

  		t.timestamps null: false
  	end

  	create_table :items do |t|
  		t.string :name
  		t.string :description
  		t.integer :unit_price
  		t.integer :merchant_id

  		t.timestamps null: false
  	end

  	create_table :merchants do |t|
  		t.string :name

  		t.timestamps null: false
  	end

  	create_table :transactions do |t|
  		t.integer :invoice_id
  		t.string :credit_card_number
  		t.string :credit_card_expiration_date
  		t.string :result

  		t.timestamps null: false
  	end
  end
end
