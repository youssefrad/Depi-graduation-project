import sys

print("Salesperson_ID\tAverage_Sales")

current_salesperson = None
current_total_sales = 0
count_sales = 0

for line in sys.stdin:
    if line.startswith("Salesperson_ID"):
        continue
    
    salesperson_id, total_sales = line.strip().split('\t')
    total_sales = float(total_sales)

    if current_salesperson == salesperson_id:
        current_total_sales += total_sales
        count_sales += 1
    else:
        if current_salesperson:
            avg_sales = current_total_sales / count_sales
            print(f"{current_salesperson}\t{round(avg_sales, 2)}")
        current_salesperson = salesperson_id
        current_total_sales = total_sales
        count_sales = 1

if current_salesperson:
    avg_sales = current_total_sales / count_sales
    print(f"{current_salesperson}\t{round(avg_sales, 2)}")

