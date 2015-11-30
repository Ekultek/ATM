	private
	
	require_relative 'error.rb'

	def transfer_funds
		puts <<-START.gsub(/^\s*>/, ' ')
			>
			>Transfer from Savings to Checking '1'
			>Transfer from Checking to Savings '2'
			>
		START
		input = gets.chomp
		case input.to_i
		when 1
			puts <<-START1.gsub(/^\s*>/, ' ')
				>
				>Your current balance in your Savings account is: #{@savings_account}
				>Your current balance in your Checking account is: #{@checking_account}
				>How much would you like to transfer from your Savings to your Checking?
				>
			START1
			transfer = gets.chomp.to_i if @savings_account > 0
			if transfer > @savings_account
				error
			else
				@savings_account -= "#{transfer}".to_f
				@checking_account += "#{transfer}".to_f
				puts <<-START2.gsub(/^\s*>/, ' ')
					>
					>Your new balance for your Savings account is #{@savings_account}
					>Your new balance for your Checking account is: #{@checking_account}
					>Would you like to make another transfer?
					>
				START2
				anthr_transfer = gets.chomp
				if anthr_transfer =~ /yes/i
					transfer_funds
				elsif anthr_transfer =~ /no/i
					puts "System will now exit for security"
					exit_screen
				else
					puts "Invalid options"
					redirect
				end
			end
		when 2
			puts <<-START3.gsub(/^\s*>/, ' ')
				>
				>Your current balance in your Checking account is: #{@checking_account}
				>Your current balance in your Savings account is: #{@savings_account}
				>How much would you like to transfer from your Checking to your Savings?
				>
			START3
			transfer = gets.chomp.to_i
			if transfer > @checking_account
				error
			else
				@checking_account -= "#{transfer}".to_f
				@savings_account += "#{transfer}".to_f
				puts <<-START4.gsub(/^\s*>/, ' ')
					>
					>Your new balance for your Checking account is #{@checking_account}
					>Your new balance for your Savings account is: #{@savings_account}
					>Would you like to make another transfer?
					>
				START4
				anthr_transfer = gets.chomp
				if anthr_transfer =~ /yes/i
					transfer_funds
				elsif anthr_transfer =~ /no/i
					puts "System will now exit for security"
					exit_screen
				else
					puts "Invalid options"
					redirect
				end
			end
		end
	end
