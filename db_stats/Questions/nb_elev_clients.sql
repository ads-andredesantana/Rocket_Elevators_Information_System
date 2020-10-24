select CompanyName, NbElevator from dim_customers
where NbElevator > 0
group by CompanyName, NbElevator
order by NbElevator desc