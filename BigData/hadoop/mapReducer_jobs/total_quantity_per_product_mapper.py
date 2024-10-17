import sys
import json

for line in sys.stdin:
    try:
        record = json.loads(line)
        product_id = record['product_id']
        quantity_sold = record['quantity_sold']
        print(f"{product_id}\t{quantity_sold}")
    except:
        continue
