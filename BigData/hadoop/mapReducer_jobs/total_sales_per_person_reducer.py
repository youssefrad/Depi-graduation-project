import sys

current_salesperson = None
current_total_sales = 0

for line in sys.stdin:
    salesperson_id, total_sales = line.strip().split('\t')
    total_sales = float(total_sales)

    if current_salesperson == salesperson_id:
        current_total_sales += total_sales
    else:
        if current_salesperson:
            print(f"{current_salesperson}\t{current_total_sales}")
        current_salesperson = salesperson_id
        current_total_sales = total_sales

if current_salesperson:
    print(f"{current_salesperson}\t{current_total_sales}")
