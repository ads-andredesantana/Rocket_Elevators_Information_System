select
  to_char(date_trunc('month', CreationDate)::date, 'Month') as "Month",
  COUNT(ContactId) as "Contacts per month" 
  from fact_contacts
  group by date_trunc('month', CreationDate)
  ORDER BY date_trunc('month', CreationDate) ASC