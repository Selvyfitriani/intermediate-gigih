class Report
    attr_reader :income, :expense, :tax, :date

    def initialize(income, expense, type, date)
        @income = income
        @expense = expense
        @tax = Tax.new(type)
        @date = date
    end

    def income_tax
        @tax.income_tax(@income)
    end
end

income_tax = report.income_tax