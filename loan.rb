private

	def loan_info
		puts <<-END.gsub(/^\s*>/, ' ')
			>
			>Hello and welcome to the credit station
			>Please choose from the list below
			>Would you like to Apply for a loan '1'
			>Check credit score '2'
			>Go back '3'
			>
		END
		input = gets.chomp
		case input.to_i
		when 1
			apply_credit
		when 2
			check_score
		else
			redirect
		end
	end
	
	def apply_credit
		if @credit_score >= 640
			accepted
		else
			denied_loan
		end
	end
	
	def accepted
		loan = %w(100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 4100 4200 4300 4400 4500 4600 4700 4800 4900 5000 5100 5200 5300 5400 5500 5600 5700 5800 5900 6000 6100 6200 6300 6400 6500 6600 6700 6800 6900 7000 7100 7200 7300 7400 7500 7600 7700 7800 7900 8000 8100 8200 8300 8400 8500 8600 8700 8800 8900 9000 9100 9200 9300 9400 9500 9600 9700 9800 9900 10000)
		loan_amount = loan.sample
		puts "You have been accepted for a #{loan_amount} loan which will be added to your bank account"
		puts <<-END.gsub(/^\s*>/, ' ')
			>
			>Which account would you like to add that to?
			>Checking Account '1'
			>Savings Account '2'
			>
		END
		input = gets.chomp
		case input.to_i
		when 1
			@checking_account += loan_amount.to_f
			puts "#{loan_amount} has been added to your checking account, your new balance is #{@checking_account}"
			puts "Your card will now be returned for security purposes."
			exit_screen
		when 2
			@savings_account += loan_amount.to_f
			puts "#{loan_amount} has been added to your savings account, your new balance is #{@savings_account}"
			puts "Your card will now be returned for security purposes"
			exit_screen
		end
	end
	
	def check_score
		puts "In order to check your score $5.99 will be charged to your account. Do you accept the charges?"
		input = gets.chomp
		if input =~ /yes/i
			@checking_account -= 5.99
			puts "Your credit score is #{@credit_score}. Would you like to apply for a loan?"
			apply = gets.chomp
			if apply =~ /yes/i
				apply_credit
			else
				return
			end
		else
			puts "You will be taken back to the main menu."
			menu
		end
	end

	def denied_loan
		puts <<-REASON.gsub(/^\s*>/, ' ')
			>
			>We regret to inform you, but you have been denied
			>for the loan. This is do to either you owing money, or
			>credit score being to low. In order to be accepted you
			>must have a credit score of 640 or higher. Your credit
			>score came back to us as #{@credit_score}. We 
			>apologize for any inconvienence this may have caused 
			>you. If you feel this was denied in error, please contact
			>your bank.
			>
			>Your card will now be returned to you..
			>
		REASON
		exit_screen
	end
	
