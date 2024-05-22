

create database bank_laon;
use bank_project;
select count(*) from finance2;
select count(*) from finance1;
desc finance1;
desc finance2;

/*   KPI-1
Year wise loan amount stats */

SELECT 
    YEAR(issue_d) AS loan_year,
    SUM(loan_amnt) AS total_loan_amount
FROM finance1
GROUP BY YEAR(issue_d)
ORDER BY loan_year;
    

/* KPI-2
Grade and subgrade wise revol_bal */



SELECT grade, sub_grade, AVG(f.revol_bal) AS avg_revol_bal
FROM Finance1 AS fn
JOIN finance2 AS f ON fn.id = f.id
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;


/* KPI-3
Toatl payment for verified status and not verified status */

SELECT verification_status , sum(total_pymnt) as Total_payment
from finance1 f1 inner join finance2 f2
on f1.id=f2.id
group by verification_status
having verification_status in ('Verified','Not Verified');







/* KPI-4
State wise n month wise loan status */

select addr_state as state , monthname(last_pymnt_d) as months , loan_status
from finance1 f1 inner join finance2 f2
on f1.id=f2.id 
group by state, monthname(last_pymnt_d), loan_status ;




 /* KPI-5
 Home ownership vs last payment date stats */

select home_ownership, last_pymnt_d 
from finance1 f1 inner join finance2 f2
on f1.id=f2.id
group by home_ownership, last_pymnt_d;

#total amount received
 select concat(round(sum(total_pymnt)/1000000,2), 'M') as Total_Amount_Received
 from finance2;
 
 #total Funded Amount
 select concat(round(sum(loan_amnt)/1000000,2), 'M') as Total_Funded_Amount
 from finance1;
 
 
 #DTI
 select avg(dti*100)
 from finance1;
 
 #Interest rate
 select avg(int_rate*100)
 from finance1;
 
