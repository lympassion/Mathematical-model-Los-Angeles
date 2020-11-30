import csv

with open('../dataset/常驻人口(单位是万).csv') as csvfile:
    reader = csv.reader(csvfile)
    # date = [row[0] for row in reader]
    income = [row[1] for row in reader]

    # print(row[0])




# print(date)
income = [float(i) for i in income[1:]]
# year = [int(i[:4]) for i in date]
print(income)
# print(year)
# print(date)