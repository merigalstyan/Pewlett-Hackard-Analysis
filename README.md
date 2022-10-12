# Employee Database Analysis

## Overview of the analysis: 

For this analysis several **csv** files were provided to clean and organize into readable, useful employee data. The company's original objective was to find the number of current employees soon to be retired. 

### Purpose:

This analysis was conducted to determine the number of retiring employees per title and to identify employees who are eligible to participate in a mentorship program. The number of retiring employees per title will help understand all the vacant positions that the company will be having.

## Results

Several **csv** files were provided but each file had different data. Thus, the initial part of this analysis included identifying all the primary and foreign keys included in these files. A significant amount of filtering was required in order to get to the result data.

The first part of the analysis was to identify the number of retiring employees. However, since some employees were assigned several titles over time due to promotions, it was requiried to retrieve the number of retiring employees with their most recent title.

### Retiring Employees 

Two out of the provided ***csv*** files contained the information needed for the analysis: **Employees.csv** and **Titles.csv**. Joining these tables on their primary keys resulted in the table containing all the data for the analysis. In addition, since only employees born between 1952 and 1955 were important for this analysis, their birth dates were filtered. 

***NOTE:*** Aliases were used to make the code more readable, clean and short.

By selecting the essential columns and using the **LEFT JOIN** function, ***Retirement Titles*** table was created:

<img width="486" alt="Screen Shot 2022-10-11 at 8 54 15 PM" src="https://user-images.githubusercontent.com/111609994/195246276-bfd16f4f-e855-4228-b462-7987f9bc74d0.png">

As already mentioned above, this table contains duplicated data since employees changed titles over time due to promotions:

<img width="718" alt="Screen Shot 2022-10-11 at 8 56 02 PM" src="https://user-images.githubusercontent.com/111609994/195246496-a12da461-004f-4707-a2dc-8d7aa8bbab2c.png">

### Getting rid of duplicates

In order to clean this data from duplicates, additional steps were taken to use only the recent titles for employees. Using the **DISTINCT ON** statement *ON* employee numbers allows to choose the unique titles for each retiring employee.  Fot this new table containing the unique titles we'll filter the **to_date** column to make sure the table contains ***only*** the current employees: 

<img width="428" alt="Screen Shot 2022-10-11 at 8 59 12 PM" src="https://user-images.githubusercontent.com/111609994/195247044-2a830d1f-3937-474d-800f-0794bc032498.png">

The new **UNIQUE TITLES** table is clear from duplicates:

<img width="718" alt="Screen Shot 2022-10-11 at 9 02 51 PM" src="https://user-images.githubusercontent.com/111609994/195247268-b7efcc58-ee26-4543-b5da-9065ec548b7a.png">

### Number of retiring employees per title

Finally, this clean data will allow us to count the number of retiring employees for each title. Now we'll see how many titles will be vacant after these employees retire. This will give the company an opportunity to prepare for hiring and training new employees. 

Using the **COUNT** function each title will be counted and the new table will be ordered by the titles. The final table will depict the number of each retiring employee per unique title:

<img width="572" alt="Screen Shot 2022-10-11 at 9 06 22 PM" src="https://user-images.githubusercontent.com/111609994/195247674-0b8a0fbc-dded-4e15-9c47-0da4b8bb5308.png">

Looks like the company will be in a lot of trouble. Many employees will be retiring especially Senior engineers and Senior staff:

<img width="477" alt="Screen Shot 2022-10-11 at 9 08 14 PM" src="https://user-images.githubusercontent.com/111609994/195247803-51ccd551-76c8-421a-98b7-87ffb299afaa.png">

### Mentorship Eligibility

Since the analysis established that many employees born between 1952 to 1955 will be retiring, it's time to figure out which employees will be eligible for the mentorship program. The first criteria is to make sure these current employees are born in 1965. For the purpose of this analysis we would need to retrieve their employee numbers, first and last names, birth dates and titles. We would also need to make sure these employees are in fact current employees. All these columns are contained in different tables. We would need to join **Employees**, **Department Employees** and **Titles** tables.

Using **LEFT JOIN** function to join these tables on their primary keys we **SELECT** all the necessary columns, insert them **INTO** a new Mentorship Eligibility table. Again, to make sure the criterias are met the birth_date is filtered to include employees born in 1965, to_date is filtered to include only the current employees. The table is filtered by employee numbers descending:

<img width="836" alt="Screen Shot 2022-10-11 at 9 17 58 PM" src="https://user-images.githubusercontent.com/111609994/195248914-36b6fea1-fef1-4aab-946d-de5e4cf5b3a7.png">

A sample of eligible employees as follows:

<img width="719" alt="Screen Shot 2022-10-11 at 9 18 30 PM" src="https://user-images.githubusercontent.com/111609994/195248954-235c9976-ded0-44d5-b855-cc75321856df.png">

## Summary

First and foremost, this analysis was conducted to identify the number of retiring employees per title. The company needed to identify how many employees will be leaving. However, many of these employees were promoted over time and thus carried different titles. It was important to identify only the unique titles to retrieve the correct number of employees soon to be retired. An important function for this section was the **DISTINCT ON** statement that allowed to remove all the duplicates and display only the unique values. Employees who were set to be retired were born between 1952 and 1955; thus, the tables were filtered. A challenge with this analysis was the enormous amount of data and the need to filter. 

Eventually, the analysis showed that there will be 25,916 empty spots for senior engineers, 24,926 empty spots for senior staff, 9,286 spots for engineers and so on. The company will be facing a serious issue of filling all these seats. This was a huge number of retiring employees. 

It seems a little late, but identifying this helped realise the company would need mentors for these vacant positions. Thus, the second part of the analysis was to identify which current employees born in 1965 will be eligible for the mentorship program. Again, **DISTINCT ON** and **LEFT JOIN** functions were used to retrieved all the eligible candidates.
 
If we were to retrieved the number of eligible employees, using the **COUNT** function would come in handy:




