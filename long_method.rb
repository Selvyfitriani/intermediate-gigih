def get_total_net_income(reports)
    reports.sum{ |report| get_net_income(report) }
end

def get_net_income(report)
    gross_income = get_gross_income(report)
    net_income = report.tax.income_tax(gross_income)
    net_income
end

def get_gross_income(report)
    gross_income = report.income - report.expense
    gross_income
end