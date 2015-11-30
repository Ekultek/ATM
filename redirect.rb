	public

	def redirect
		puts <<-END.gsub(/^\s*>/, ' ')
				>
				>Please choose from the list below
				>Main menu '1'
				>Checking inquiries  '2'
				>Savings account information '3'
				>Transfer funds '4'
				>Apply or view a loan '5'
				>Return card and exit system '6'
				>
			END
		input = gets.chomp
		case input.to_i
		when 1
			menu
		when 2
			checking_information
		when 3
			savings_information
		when 4
			transfer_funds
		when 5
			loan_info
		when 6
			exit_screen
		else
			puts "Invalid option"
			redirect
		end
	end

	private
	
	def check
		puts "Reenter PIN:"
		pin_num = gets.chomp.to_i
		if pin_num == @pin_number
				redirect
		else
			puts "Invalid PIN, exiting..."
			exit_screen
		end
	end
