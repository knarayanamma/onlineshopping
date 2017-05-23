class Customer < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	 #validates_format_of :mobilenumber, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
	 validates :password, presence:true
	 validates :confirmpassword, presence:true
	 validates :mobilenumber ,presence: true,numericality:true


	def self.authenticate(email,password)
		if@customer=Customer.where(email: email,password: password).last
			@customer
		else
			nil
		end
	end

end
