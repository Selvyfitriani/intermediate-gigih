def get_total_net_income(reports)
    total_net_income = 0

    reports.each do |report|
        net_income = get_net_income(report)
        total_net_income = total_net_income + net_income
    end
    
    return total_net_income
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