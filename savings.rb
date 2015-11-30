	private

	def savings_information
		puts <<-END1.gsub(/^\s*>/,' ')
			>
			>Your current savings balance is #{@savings_account}
			>Deposit funds '1'
			>Make a Withdrawl '2'
			>Transfer funds '3'
			>Go back '4'
			>
		END1
		input = gets.chomp
		case input.to_i
		when 1
			deposit_savings
		when 2
			withdraw_savings
		when 3
			transfer_funds
		when 4
			redirect
		else
			puts "Invalid option"
			savings_information
		end
	end
	
	def deposit_savings
		puts "Your current balance is #{@savings_account}, how much would you like to deposit?"
		input = gets.chomp.to_i
		@savings_account += input
		puts "Your new balance is #{@savings_account}, would you like to make another deposit?"
		anthr_deposit = gets.chomp
		if anthr_deposit =~ /yes/i
			deposit_savings
		elsif anthr_deposit =~ /no/i
			check
		else
			puts "Invalid option, exiting."
			exit_screen
		end
	end
	
	def withdraw_savings
		puts "You current balance is #{@savings_account}, how much would you like to withdraw?"
		input = gets.chomp.to_i
		if input > @savings_account
			puts "You do not have that much money in this account"
			withdraw_savings
		else
			@savings_account -= input
			puts "Your new balance is #{@savings_account}, would you like to make another withdrawl?"
			withdrawl = gets.chomp
			if withdrawl =~ /yes/i
				withdraw_savings
			elsif withdrawl =~ /no/i
				check
			else
				puts "Invalid option, exiting."
				exit_screen
			end
		end
	end
