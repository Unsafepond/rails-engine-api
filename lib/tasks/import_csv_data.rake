require 'csv'
namespace :import_csv do

  task :create_customers => :environment do
    csv_text = File.read('./lib/data/customers.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		Customer.create!(row.to_hash)
		end
  end

  task :create_invoice_items => :environment do
  	csv_text = File.read('./lib/data/invoice_items.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		InvoiceItem.create!(row.to_hash)
		end
	end 

	 task :create_invoices => :environment do
  	csv_text = File.read('./lib/data/invoices.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		Invoice.create!(row.to_hash)
		end
	end 

	task :create_items => :environment do
  	csv_text = File.read('./lib/data/items.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		Item.create!(row.to_hash)
		end
	end 

	task :create_merchants => :environment do
  	csv_text = File.read('./lib/data/merchants.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		Merchant.create!(row.to_hash)
		end
	end 

	task :create_transactions => :environment do
  	csv_text = File.read('./lib/data/transactions.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		Transaction.create!(row.to_hash)
		end
	end 

end