class Report
    attr_reader :income, :expense, :tax, :date

    def initialize(income, expense, tax, date)
        @income = income
        @expense = expense
        @tax = Tax.new(type)
        @date = date
    end
end

income_tax = report.tax.income_tax(gross_income)