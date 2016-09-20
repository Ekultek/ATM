	private

	def checking_information
		puts <<-END.gsub(/^\s*>/, ' ')
			>
			>Your current balance is: #{@checking_account}
			>Deposit funds '1'
			>Make a withdrawl '2'
			>Transfer funds '3'
			>Go back '4'
			>
		END
		input = gets.chomp
		case input.to_i
		when 1
			deposit_checking
		when 2
			withdrawl_checking
		when 3
			transfer_funds
		when 4
			redirect
		else
			puts "Invalid option"
			checking_information
		end
	end
	
	def deposit_checking
		puts "Enter amount to deposit:"
		amount = gets.chomp.to_i
		@checking_account += amount.to_f
		puts "Your new balance is #{@checking_account}"
		puts "Would you like make another deposit?"
		input = gets.chomp
		if input == /yes/i
			deposit
		else
			check
		end
	end
	
	def withdrawl_checking
		puts "Your current balance is #{@checking_account}. Please enter amount to withdrawl:"
		input = gets.chomp.to_i
		if input > @checking_account
			puts "You do not have that much money please enter another amount"
			withdrawl_checking
		else
			@checking_account -= input.to_f
			puts "Your new balance is #{@checking_account}"
			puts "Would you like to make another withdrawl enter '1' for yes '2' for no?"
			withdrawl = gets.chomp.to_i
			case withdrawl.to_i
			when 1
				withdrawl_checking
			else
				check
			end
	end
