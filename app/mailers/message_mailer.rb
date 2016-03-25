class MessageMailer < ApplicationMailer
	default from: "Class Reviews"
	default to: "jooshman54@gmail.com"

	def new_message(message)
		@message = message
		mail subject: "CLASS CONTACTUS - subject: #{message.subject}"
	end
end
