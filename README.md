# SETUP

- clone repository
- run ```bundle install``` and ```rake db:setup```
- start rails server

# The Task

Payroll is an entity that represents a header of a regular payroll document (salary).
It contains information about the period of the payroll - start and end dates.

Salary is paid two times a month on 5-th and 20-th day of the month.

Example: 

 - on 20 Jan it generates a payroll for the period of 5 Jan to 19 Jan
 - on 5 Feb it generates a payroll for the period of 20 Jan to 4 Feb

# What you have to do

1. On manual action it should generate a new payroll according to a schedule. 
    * If no payrolls exists yet, it should generate a payroll starting from 2 months back.
    * Payrolls should not be generated for the future.
    * Each new payroll should have consequent dates without gaps.
    * Take into account that payroll schedule can be changed (to other days of month, frequency, etc.)
2. Advanced: trigger payroll generation automatically according to a schedule. 
