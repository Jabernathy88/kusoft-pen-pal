class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'
	belongs_to :language

	def self.levels_within_range?(message)
		language = message.language
		sender = message.sender
		recipient = message.recipient

		if language && sender && recipient
			sender_proficiency = Proficiency.find_by(user_id: sender.id, language_id: language.id)
			recipient_proficiency = Proficiency.find_by(user_id: recipient.id, language_id: language.id)

			if sender_proficiency && recipient_proficiency && sender_proficiency.level && recipient_proficiency.level
				sender_level = sender_proficiency.level+2 # adding the +2 to avoid negative number in logic below
				sender_level = sender_proficiency.level+2
	
				if sender_level >= recipient_level-2 && sender_level <= recipient_level+2
					return true
				else
					false
				end 
			else
				false
			end
		else
			false
		end
	end

end