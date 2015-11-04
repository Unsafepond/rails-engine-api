class Invoice < ActiveRecord::Base
	has_many :transactions
	has_one :merchant
end
