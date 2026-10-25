Task 1 · Five-Part Prompt
-------------------------
A prompt that reproduces q13

QUESTION: Write a prompt labelled Role, Task, Context, Constraints and Format that asks an assistant for q13.

Role		: You are a senior data analyst who writes clean, portable SQL.
Task		: Write one query giving, for each sales rep and month, the monthly target, completed revenue and a performance tier.
Context		: SQLite (state your dialect). reps(rep_id, rep_name, region, monthly_target); 
		  customers(customer_id, first_name, last_name, city, region, age, rep_id); orders(order_id, customer_id, item, quantity, amount, status, order_month). customers.rep_id = reps.rep_id; orders.customer_id = customers.customer_id.
Constraints	: Completed orders only. ‘Below Target’ if revenue < monthly_target; ‘On Target’ if ≥ target and < 1.1 × target;
	          ‘Above Target’ otherwise. Columns rep_name, order_month, monthly_target, revenue, performance_tier; 
                  order by rep_name, order_month. No WITH clauses, no stored procedures.
Format		: Raw SQL only, no text before or after, with inline -- comments.

Task 2 · Inspect Scenerio D1
----------------------------
Four defects in the AI’s answer

QUESTION: SELECT region_name, SUM(total_sales) AS sales FROM sales WHERE SUM(total_sales) > 80000 GROUP BY region_name … + “North grew 38%”

1)  Defect		  : Table sales does not exist
    classification        : Fake method/function
    Correct clause or fix : From orders o JOIN customers c on o.customer_id=c.customer_id

2)  Defect		  : Column region_name,total_sales do not exist
    classification        : Fake method/function
    Correct clause or fix : Use c.region and o.amount

3)  Defect		  : SUM() placed WHERE
    classification        : Logic error
    Correct clause or fix : WHERE o.status='completed'...HAVING SUM(o.amount)>80000

4)  Defect		  : Grew 38% month over month" with no evidence
    classification        : Phantom statistic
    Correct clause or fix : Compute it from q11:North Sep->Oct is -22.8%

Task 3 · Verify Scenario D1
---------------------------
sql/d1_corrected.sql and the real growth rate

QUESTION: Fix the query against the real schema (keep 80,000), run it, then test the 38% claim with q11.

-- Which regions sell the most? (fixed)
SELECT c.region,
  SUM(o.amount) AS sales
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region
HAVING SUM(o.amount) > 80000
ORDER BY sales DESC;

	region	   |	sales
        ---------------------- 
        North      |    119300
        South      |     82500

2 rows. West (74,900) and East (69,500) fall below 80,000.
North, from q11: (41,300 − 53,500) ÷ 53,500 × 100
−22.8%
The data contradicts the +38% growth claim: North fell.

Task 4 . Apply the Human-in-the-loop protocol
---------------------------------------------
Five steps, ending in a decision
QUESTION: Write one short paragraph per step for Scenario D1, and name the evidence behind your decision.

1. Specification:
   Sell the most” means completed revenue per customer region, from orders + customers, 
   keeping regions over 80,000.

2. Execution:
   Ran the AI query on the seed. It fails: no table sales, and SUM() is not allowed in WHERE.

3. Inspection:
   Found 4 defects: fake table, fake columns, aggregate in WHERE, unsupported 38%.

4. Verification:
   Corrected query returns North 119,300 and South 82,500, matching q11 totals. North Sep → Oct = −22.8%.

5. Decision:
   Reject the AI answer: it does not run and 38% is contradicted. Accept d1_corrected.sql: it runs and reconciles with q11.

Task 5 . Prompt for Scenario D2. 
--------------------------------
QUESTION: Write a five-part prompt that gives an assistant what it needs, then state the root cause and repair the formula yourself

Role	   : You are a spreadsheet troubleshooting expert.
Task	   : Find why my lookup says “not found” and give a fixed formula.
Context    : orders!G2 holds “␣Smart Watch” (a space before S). Formula: =VLOOKUP(G2, $A$2:$C$10, 3, FALSE). products is A1:C10: header row 1, items in A, unit prices in C; “Smart Watch” is in column A. Expected result: 4500.
Constraints: keep exact match (FALSE); no hand-editing the data; the fix must copy down.
Format	   : a one-sentence root cause, then the corrected formula.

Root cause:
The leading space: “␣Smart Watch” is not equal to “Smart Watch”, so the exact match fails.

Repaired formula:  =VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)  
                    
Task 6 . Skeptical-analyst check on Part C:
-------------------------------------------

Challenge Recommendation 1
QUESTION: Prompt an assistant to challenge Rec 1, then list 3+ unstated assumptions, each with a figure or check from your data.

Prompt
------
Act as a skeptical analyst. 
My recommendation: Fund a Home and Air Fryer promotion in North, because North revenue fell 53,500 → 41,300 → 24,500. List the unstated assumptions, 
                   and say what evidence would show the promotion causes a recovery, not just correlates with one.”

    Assumption					| Recommendation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
-------------------------------------------------------------------------------------------------------
1. The fall is broad not one customer		| In sep customer 5 gave 35,700 of North's 53,500(67%).
						| one big buyer may explain the "drop".
-------------------------------------------------------------------------------------------------------
2. North shoppers want Home items.		| North Home went 24,600->1900->0. Compare south Home
						| at 43,800.
-------------------------------------------------------------------------------------------------------
3. No revenue is stuck in other statuses.	| North has 2 pending (4700) and 1 disputed (9600):too
                                           	| small to explain a 29,000 fall.
-------------------------------------------------------------------------------------------------------
4. 3 months show a trend			| Only 3 points, no prior-year data: run the promo as
						| a pilot.
-------------------------------------------------------------------------------------------------------








