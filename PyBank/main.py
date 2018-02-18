import os
import csv

f1 = os.path.join("budget_data_1.csv")
f2 = os.path.join("budget_data_1.csv")
f1_output = "analysis/budget_data"
budget_data = {}
total_revenue = 0
total_months = 0



with open(f1, newline ="") as csvfile:
	csvreader = csv.reader(csvfile, delimiter=",")   
	new_line = next(csvreader)
	
	




	for x in csvreader:
		
	
		row = x

	
		
		#total_months = total_months + 1
		total_revenue = total_revenue + float(row["Revenue"])


	print(total_months)
			
	
	




	

		


	
			



	


