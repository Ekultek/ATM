#!/usr/bin/env ruby

################
#ATM Rewrite 
#                                
#Creator Lost Bam      
#				         
#11/19/15		         
##################

require_relative 'checking.rb'
require_relative 'savings.rb'
require_relative 'transfer.rb'
require_relative 'loan.rb'
require_relative 'exit.rb'
require_relative 'redirect.rb'

class ATM
	attr_accessor :name, :checking_account, :savings_account, :pin_number, :transfer, :loan
		def initialize( name, checking_account, savings_account, pin_number, credit_score )
			@name = name
			@checking_account = checking_account
			@savings_account = savings_account
			@pin_number = pin_number
			@credit_score = credit_score
		end
	
		def pin 
			x = 3
			while (x > 0) do
				puts "Enter PIN(#{x} attempts left):"
				pin_num = gets.chomp
				if pin_num =~ /^\d{4}/
					case pin_num.to_i
					when @pin_number
						menu
					else
						puts "Invalid PIN"
						x -= 1
						bad_pin if x == 0
					end
				else
					puts "Invalid PIN, must be four digit combination"
					x -= 1
					bad_pin if x == 0			
				end
			end
		end
						
		def menu 
			puts <<-END.gsub(/^\s*>/, ' ')
				>
				>Welcome #{name} thank you for choosing Bank of Bam.
				>You may choose from the list below of what you would like to do
				>For checking inquiries press '1'
				>For savings account information press '2'
				>To transfer funds press '3'
				>To either apply for a loan, or get information on a loan press '4'
				>To exit the system press '5'
				>
			END
			input = gets.chomp
			case input.to_i
			when 1
				checking_information
			when 2
				savings_information
			when 3
				transfer_funds
			when 4
				loan_info
			when 5
				exit_screen
			else
				puts "Error Invalid option please try again"
				menu
			end
		end

	
		def bad_pin
			abort('Exiting system, all attempts failed...')
			exit
		end
	end
