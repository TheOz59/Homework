import os
import csv

f1 = os.path.join("budget_data_1.csv")
f2 = os.path.join("budget_data_1.csv")

budget_data = {}


with open(f1, newline ="") as csvfile:
	csvreader = csv.reader(csvfile, delimiter=",")   
	new_line = next(csvreader)
	
	
	for x in csvreader:
		row = x
		row[1] = float(x[1])
		
		if row[0] in budget_data:
			budget_data[row[0]] += row[1]
		else:
			budget_data[row[0]] = row[1]


	print(budget_data)
	
	


			


