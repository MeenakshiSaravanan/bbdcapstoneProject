1. Download the data from sql compiler by running query no 9 save the file as "orders_enriched.csv".

2. In this file add two tabs: orders,Products

a)
1. Data from this query to be placed on orders tab, order-month column to formatted as text. Trim the unwanted spaces
   on first name and last name.

2. on the products tab, download the data by running the query "SELECT item, category, unit_price FROM products ORDER BY item" 

3. on the orders tab i have added a column "category" and apply the below formula:
   =vlookup(G2,products!$A$2:$C$11,2,false)
  --- G2 is the item column
  --- range from products tab 	
  --- 2 indicates second column category in products tab 

4. on the orders tab i have added a column "unit price" and apply the below formula:
   =xlookup(G2,products!$A$1:$A$10,products!$C$1:$C$10,"NULL")
   --- G2 is the item column
   --- range of item column from products tab
   --- range of category column from produts tab.

5. on the orders tab i have added a column "Revenue_calc" and apply the below formula:
   =I2*J2 (quantity*unit price)

b)
1. compute COUNT, SUM, AVERAGE, MIN and MAX of amount in a labelled block of cells.

   Count of completed |	 Sum	| Average  |    Min	| Max
	63	      |	346200	| 5495.24  |   1100	| 15600

c)
1. Just for checking i have added "Pivot table 1" by category and amount.

2. I ve added "Pivot table 2" with two tables:
   i) rows=category, columns=region, values=amount
   ii)rows=order_month,values=sum of amount,count of orders.

   Results on Pivot table:
   ----------------------

			SUM of amount	region					
	-----------------------------------------------------------
	category	East	North	South	West	Grand Total	
	-----------------------------------------------------------
	Apparel		10600	19400	10000	37500	 77500	
	Electronics	21400	73400	28700	18800	 142300	
	Home		37500	26500	43800	18600	 126400	
	Grand Total	69500	119300	82500	74900	 346200	
						
					
	order_month	SUM of amount	     COUNT of order_id				
	---------------------------------------------------------
	2026-09		98300			19				
	2026-10		93100			20				
	2026-11		154800			24				
	Grand Total	346200			63				
d)
	Reconciliation table:
	--------------------
	Count of completed	Sum	Average		Min	Max
	63			346200	5495.24		1100	15600

e)
	Data validation
        ---------------
	Handled missing amounts:
	-----------------------
        1001,1010 and 1064 are all pending, so the filter "comleted" drops these ids,it get left blank not 0.
	
	Data types:
	-----------
        1.Amount,Unit price,quantity columns are formatted as numbers by ISNUMBER() is set to TRUE.						
	2.COUNTA() gives 63
	3.order-month is set as Text.
        	
	Duplicates and outliers:
	----------------------- 
	COUNTUNIQUE(A2:A91) gives 90. No duplicate order id.
	Largest amount of completed order is 15600 is shared by 1061,1065,1069,1077 (3 Air Friers * 5200)
	
	Decision for a colleague:
	------------------------
	Revenue counts completed orders only. Blank amounts stay blank never 0.
	order-month  data type is set as text.

f)
	Setup
	-----
	1. Two tabs: Orders, Products
	2. Orders  =90rows(A1:M91)
           products=9rows (A1:c10)
	3. on the orders tab apply a filter for "completed" and copy this data to a new sheet name it as 
	   "completed_orders".	
	4. Amount column is set with descending order.	