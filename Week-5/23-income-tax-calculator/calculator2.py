#!/soft/anaconda3/bin/python

import sys

salary = sys.argv[1]
salary_for_tax = int(salary) - 3500
tax_rate = [0.03, 0.1, 0.2, 0.25, 0.3, 0.35, 0.4]
exclude_num = [0, 105, 555, 1005, 2755, 5505, 13505]
if salary_for_tax <= 1500:
    tax_class = 0
elif salary_for_tax <= 4500:
    tax_class = 1
elif salary_for_tax <= 9000:
    tax_class = 2
elif salary_for_tax <= 35000:
    tax_class = 3
elif salary_for_tax <= 55000:
    tax_class = 4
elif salary_for_tax <= 80000:
    tax_class = 5
else:
    tax_class = 6
tax = salary_for_tax * tax_rate[tax_class] - exclude_num[tax_class]
print(format(tax, ".2f"))
