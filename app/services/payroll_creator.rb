class PayrollCreator
	PAYROLL_DAYS = [5, 20].sort

	attr_reader :start_date, :end_date

	def generate
		set_payroll_dates
		puts @start_date, @end_date
		Payroll.create(starts_at: @start_date, ends_at: @end_date)
	end

	private

	def set_payroll_dates
		@start_date = find_next_payroll(last_payroll)
		
		day_after_end_date = find_next_payroll(@start_date)

		@end_date = day_after_end_date.change(day: day_after_end_date.day - 1)
	end

	def end_date(next_payroll)
		return Date.today.yesterday if Date.today.day == payroll_day

		Date.new(Date.today.year, Date.today.month, Date.today.yesterday.day)
	end

	def find_next_payroll(relative_payroll)
		PAYROLL_DAYS.find do |day|
			if day > relative_payroll.day
				return relative_payroll.change(day: day)
			end
		end

		relative_payroll.change(month: relative_payroll.month + 1, day: PAYROLL_DAYS.first)
	end

	def last_payroll
		payroll = Payroll.exists? ? Payroll.last.ends_at : Date.today - 2.month
	end
end