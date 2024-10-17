import sys

current_product = None
current_quantity_sold = 0

for line in sys.stdin:
    product_id, quantity_sold = line.strip().split('\t')
    quantity_sold = int(quantity_sold)

    if current_product == product_id:
        current_quantity_sold += quantity_sold
    else:
        if current_product:
            print(f"{current_product}\t{current_quantity_sold}")
        current_product = product_id
        current_quantity_sold = quantity_sold

if current_product:
    print(f"{current_product}\t{current_quantity_sold}")
