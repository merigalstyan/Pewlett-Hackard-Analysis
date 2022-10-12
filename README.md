# Employee Database Analysis

## Overview of the analysis: 

For this analysis, several **CSV** files were provided to clean and organize into readable, valuable employee data. The company's original objective was to find the number of current employees soon to be retired. 

### Purpose:

This analysis was conducted to determine the number of retiring employees per title and identify eligible employees to participate in a mentorship program. The number of retiring employees per title will help understand all the vacant positions the company will have.

## Results

Several **CSV** files were provided, but each file had different data. Thus, the initial part of this analysis included identifying all the primary and foreign keys in these files. A significant amount of filtering was required to get to the result data.

The first part of the analysis was identifying the number of retiring employees. However, since some employees were assigned several titles over time due to promotions, it was required to retrieve the number of retiring employees with their most recent titles.

### Retiring Employees 

Two of the provided ***CSV*** files contained the information needed for the analysis: **Employees.csv** and **Titles.csv**. Joining these tables on their primary keys resulted in the table containing all the data for the analysis. In addition, since only employees born between 1952 and 1955 were needed for this analysis, their birth dates were filtered. 

***NOTE:*** Aliases were used to make the code more readable, clean, and short.

By selecting the essential columns and using the **LEFT JOIN** function, the  ***Retirement Titles*** table was created:

<img width="486" alt="Screen Shot 2022-10-11 at 8 54 15 PM" src="https://user-images.githubusercontent.com/111609994/195246276-bfd16f4f-e855-4228-b462-7987f9bc74d0.png">

As already mentioned above, this table contains duplicated data since employees changed titles over time due to promotions:

<img width="718" alt="Screen Shot 2022-10-11 at 8 56 02 PM" src="https://user-images.githubusercontent.com/111609994/195246496-a12da461-004f-4707-a2dc-8d7aa8bbab2c.png">

### Getting rid of duplicates

To clean this data from duplicates, additional steps were taken to use only the recent titles for employees. Using the **DISTINCT ON** statement *ON* employee numbers allows one to choose the unique titles for each retiring employee.  For this new table containing the unique titles, we'll filter the **to_date** column to make sure the table contains ***only*** the current employees: 

<img width="428" alt="Screen Shot 2022-10-11 at 8 59 12 PM" src="https://user-images.githubusercontent.com/111609994/195247044-2a830d1f-3937-474d-800f-0794bc032498.png">

The new **UNIQUE TITLES** table is clear from duplicates:

<img width="718" alt="Screen Shot 2022-10-11 at 9 02 51 PM" src="https://user-images.githubusercontent.com/111609994/195247268-b7efcc58-ee26-4543-b5da-9065ec548b7a.png">

### Number of retiring employees per title

Finally, this clean data will allow us to count retiring employees per title. Now we'll see how many titles will be vacant after these employees retire. This will allow the company to prepare for hiring and training new employees. 

Using the **COUNT** function, each title will be counted, and the titles will order the new table. The final table will depict the number of each retiring employee per unique title:

<img width="572" alt="Screen Shot 2022-10-11 at 9 06 22 PM" src="https://user-images.githubusercontent.com/111609994/195247674-0b8a0fbc-dded-4e15-9c47-0da4b8bb5308.png">

Looks like the company will be in a lot of trouble. Many employees will be retiring especially Senior engineers and Senior staff:

<img width="477" alt="Screen Shot 2022-10-11 at 9 08 14 PM" src="https://user-images.githubusercontent.com/111609994/195247803-51ccd551-76c8-421a-98b7-87ffb299afaa.png">

### Mentorship Eligibility

Since the analysis established that many employees born between 1952 to 1955 will be retiring, it's time to figure out which employees will be eligible for the mentorship program. The first criterion is ensuring these current employees were born in 1965. For this analysis, we would need to retrieve their employee numbers, first and last names, birth dates, and titles. We also need to make sure these employees are current employees. All these columns are contained in different tables. We need to join the  **Employees**, **Department Employees**, and **Titles** tables.

Using the  **LEFT JOIN** function to join these tables on their primary keys, we **SELECT** all the necessary columns and insert them **INTO** a new Mentorship Eligibility table. Again, to ensure the criteria are met, the birth_date is filtered to include employees born in 1965, and to_date is filtered to include only the current employees. The table is filtered by employee numbers descending:

<img width="836" alt="Screen Shot 2022-10-11 at 9 17 58 PM" src="https://user-images.githubusercontent.com/111609994/195248914-36b6fea1-fef1-4aab-946d-de5e4cf5b3a7.png">

A sample of eligible employees as follows:

<img width="719" alt="Screen Shot 2022-10-11 at 9 18 30 PM" src="https://user-images.githubusercontent.com/111609994/195248954-235c9976-ded0-44d5-b855-cc75321856df.png">

## Summary

First and foremost, this analysis was conducted to identify the number of retiring employees per title. The company needed to identify how many employees would be leaving. However, many of these employees were promoted over time and thus carried different titles. Identifying only the unique titles was essential to retrieve the correct number of employees soon to be retired. An important function for this section was the **DISTINCT ON** statement that allowed the removal of all the duplicates and displayed only the unique values. Employees who were set to be retired were born between 1952 and 1955; thus, the tables were filtered. A challenge with this analysis was the enormous amount of data and the need to filter. 

Eventually, the analysis showed there would be 25,916 spots for senior engineers, 24,926 empty spots for senior staff, 9,286 spots for engineers, and so on. This was a large number of retiring employees. The company will be facing a severe issue in filling all these seats. 

It seems a little late, but identifying this helped realize the company would need mentors for these vacant positions. Thus, the second part of the analysis was to identify which current employees born in 1965 will be eligible for the mentorship program. Again, the **DISTINCT ON** and **LEFT JOIN** functions were used to retrieve all the eligible candidates.
 
If we were to retrieve the number of eligible employees per title, using the **COUNT** function would come in handy:

<img width="423" alt="Screen Shot 2022-10-11 at 9 41 29 PM" src="https://user-images.githubusercontent.com/111609994/195251762-53dcd17d-44b7-4d21-81c9-8e8599c1ffd5.png">

Even though there are many eligible employees, it looks like there aren't enought employees to recover even half the empty spots. The company needs to take this into consideration and start actively working on a solution.

<img width="302" alt="Screen Shot 2022-10-11 at 9 42 39 PM" src="https://user-images.githubusercontent.com/111609994/195251840-92a4bcd1-817f-405d-a867-6d24e39215de.png">




