#!/usr/bin/env python3
import sys
from collections import namedtuple


Data_For_Tax_Cal = namedtuple(
    "Data_for_tax_cal",
    ["start_point", "tax_rate", "quick_subtractor"])


Data_For_Tax_Cal_Table = [
    Data_For_Tax_Cal(80000, 0.45, 13505),
    Data_For_Tax_Cal(55000, 0.35, 5505),
    Data_For_Tax_Cal(35000, 0.30, 2755),
    Data_For_Tax_Cal(9000, 0.25, 1005),
    Data_For_Tax_Cal(4500, 0.20, 555),
    Data_For_Tax_Cal(1500, 0.10, 105),
    Data_For_Tax_Cal(0, 0.03, 0)]


def cal_salary_after_tax(income):
    insurance = income * (0.08 + 0.02 + 0.005 + 0.06)
    val_for_cal = income - insurance - 3500
    if val_for_cal <= 0:
        return format(income - insurance, ".2f") 
    for item in Data_For_Tax_Cal_Table:
        if val_for_cal > item.start_point:
            tax = val_for_cal * item.tax_rate - item.quick_subtractor
            salary_after_tax = income - insurance - tax 
            return format(salary_after_tax, ".2f")


def main():
    for arg in sys.argv[1:]: 
        employee_id, input_income = arg.split(":")
        try:
            income = int(input_income)
        except ValueError:
            print("Parameter Error")
        salary_after_tax = cal_salary_after_tax(income)
        print("{}:{}".format(employee_id, salary_after_tax))


if __name__ == "__main__":
    main()
