	def error
		puts <<-EOT.gsub(/^\s*>/, ' ')
			>
			>Cannot complete transaction.
			>Either your account is overdrawn, you
			>do not have access to this section, or
			>you cannot transfer that amount. If you
			>feel you have reached this in error please
			>contact your bank.
			>
			>Error #28-971-9087 has been logged
			>
			>Exiting system for security
			>
		EOT
		exit_screen
	end
