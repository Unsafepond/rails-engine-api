class Invoice < ActiveRecord::Base
	has_one :merchant
end
