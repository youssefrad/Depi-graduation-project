import sys

current_branch = None
current_total_sales = 0

for line in sys.stdin:
    try:
        branch_name, total_sales = line.strip().split('\t')
        total_sales = int(total_sales)

        if current_branch == branch_name:
            current_total_sales += total_sales
        else:
            if current_branch:
                print(f"{current_branch}\t{current_total_sales}")
            current_branch = branch_name
            current_total_sales = total_sales
    except ValueError:
        continue

if current_branch:
    print(f"{current_branch}\t{current_total_sales}")


