class Proficiency < ApplicationRecord
	belongs_to :user
	belongs_to :language
	before_save :adjust_level_min_max
	
	def adjust_level_min_max
		if self.level < 1 
			self.level = 1
		end
		if self.level > 10
			self.level = 10			
		end 
	end

end