import sys
import json

for line in sys.stdin:
    try:
        record = json.loads(line)
        branch_name = record.get('branch_name')
        total_sales = record.get('totalsales')
        
        if branch_name and total_sales:
            print(f"{branch_name}\t{total_sales}")
    except json.JSONDecodeError:
        continue

