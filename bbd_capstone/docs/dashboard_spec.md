Data source section: connect to data/orders_clean.csv and list each of its 13 columns in a table with a Dimension or Measure classification. 
Treat order_id as a Dimension (it is an identifier, not something you add up), 
treat unit_price, quantity, amount and revenue_calc as Measures.

Specify two KPI cards: Total Revenue (sum of amount) = Rs.346200
		       Total Units Sold (sum of quantity)=106


Revenue card equals Part A's q05 total_revenue.

order_month	SUM of amount	     COUNT of order_id
-------------------------------------------------------
2026-09		98300			19
2026-10		93100			20
2026-11		154800			24
------------------------------------------------------
Grand Total	346200			63
------------------------------------------------------

Chart sheets:
--------------
Specify four worksheets. For each, state the chart type, the fields on the row, column and colour shelves, a one-sentence reason why that chart type suits the question, and a plain-text data table of the exact numbers the chart displays:
1.Revenue by Region (bar):rows=region, measures=sum(amount)
2.Revenue by Category (bar chart):rows=category, measures=sum(amount)
3.Revenue Trend by Month and Category (line chart over order_month, one line per category);
4.Region x Category Detail (text table with exact values).


Dashboard layout:
-----------------
placement order :
1.KPI cards first,
2.then the region and category filter, 
3.trend chart, 
4.the comparison charts,
5.the detail table.

The horizontal and vertical containers used here to place a category filter placed in the top band, directly below the KPI cards, 
and applied to all four worksheets that use this data source, 
and one sentence describing what happens to the other charts when a user clicks a bar in Revenue by Region with Use as Filter switched on.
It shows change over time and one line per category lets u compare trends.

Insight and recommendation narrative in three headed subsections:
Summary:
1.Revenue is on increasung trend mainly on Electronics category of Rs.142300 and least is on Apparel of Rs.77500 
2.North region led with Rs.119300 and least in the East region of about Rs.69500.
3.North fell every month 53500->41300->24500 while East rose from 6400 ->50900
Recommendations:
1.Improve marketing and discount offers for Home category in North. Becoz North fell 53500->41300->24500, North Home was 1900 in oct, o in Nov 
2.extend the promotion in West -Apparel. Becoz West Apparel is 37500, 48% of apparel revenue(77500).
3.Pre stock Air Fryer before the next peak. Becoz Home rose 12600(oct)->83200(Nov) South Home=43800, East Home=37500
Have to watch Air Fryer completed units and the pending to completed units rate.


Reconciliation table:
---------------------
Total Revenue KPI= 346200

sum of the Revenue by Region;
------------------------------
East	North	South	West	Grand Total
69500	119300	82500	74900	346200

sum of the Revenue by Category:
-------------------------------
Apparel	Electronics  Home    Grand Total
77500 	142300       126400  346200

Part B's pivot grand total side by side all four are to be equal.

SUM of amount	region				
------------------------
category	East	North	South	West	Grand Total
------------------------------------------------------------
Apparel		10600	19400	10000	37500	77500
Electronics	21400	73400	28700	18800	142300
Home		37500	26500	43800	18600	126400
------------------------------------------------------------
Grand Total	69500	119300	82500	74900	346200