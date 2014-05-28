class Trainer < ActiveRecord::Base
	has_secure_password
	has_many :groups
	#accepts_nested_attributes_for :groups
	#attr_accessible :email, :password, :password_confimation

	validates_uniqueness_of :username
end


def name
	"#{trainer_name} #{last_name}"
end