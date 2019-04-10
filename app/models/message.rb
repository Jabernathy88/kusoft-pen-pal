class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'
	belongs_to :language

	def self.levels_within_range?(message)
		language = message.language
		sender = message.sender
		recipient = message.recipient

		if language && sender && recipient			
			sender_level = Proficiency.find_by(user_id: sender.id, language_id: language.id).level+2 # adjust to avoid negative number for logic below
			recipient_level = Proficiency.find_by(user_id: recipient.id, language_id: language.id).level+2

			if sender_level && recipient_level && sender_level >= recipient_level-2 && sender_level <= recipient_level+2
				return true
			else
				false
			end
		else
			false
		end
	end

end