def average_income_in(date_range)
    total_days = date_range.get_total_days
    total_income / total_days
end

class DateRange
    def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date
    end

    def get_total_days
        (@end_date - @start_date).to_i
    end
end