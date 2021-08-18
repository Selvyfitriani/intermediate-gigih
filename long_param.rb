def total_income_in(daterange, reports)

end

def total_expense_in(daterange, reports)

end

def total_net_income_in(daterange, reports)

end

class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date
    end
end