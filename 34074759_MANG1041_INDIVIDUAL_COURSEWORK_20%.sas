/* Q1. I am importing the excel file of baby names 'names' into sas and identify what type of database this file is using the 'dbms'command,
as it is a CSV file using the PROC step */
proc import datafile='\Users\hashe\OneDrive\Documents\Southampton Uni\Semester 2\MANG1041 - Analytics Programming 1\Coursework - 20%\names.csv'
	out=names
	dbms=csv;
run;
/* Q2. Here I create a seperate dataset 'Female_names' that only contains names where the variable Gender='F' (only female names) and 
exclude the 'Gender' variable in this seperate datasheet using the drop command using the PROC step */
proc sort data=Names out=work.Female_names (drop=gender);
	by Name Count;
	where Gender='F';
run;
/* Q3. Here I add the variable 'Fraction' in the data set 'Female_names' by dividing 
the 'Count' variable by the total number of female names (180623104) using the DATA step */
data Female_names;
	set Female_names;
	Fraction=Count/180623104;
run;
/* Q4. Here I sort the data set 'Female_names' by the variable 'Count', using the 'descending' command which will sort the observations
in the data set according to the 'Count' variable from the largest count to the smallest using the PROC step */
proc sort data=Female_names;
	by descending Count;
run; 
/* Q5. Here I print the first 35 names of the newly sorted data set 'Female_names',
which will show the 35 most popular names through the '(obs=x)' command and I give at an according title using the PROC step */
proc print data=Female_names (obs=35);
	title 'Top 35 female names by popularity';
run;
/* Q6. Here I create a seperate dataset 'Male_names' that only contains names where the variable Gender = 'M' (only male names) and 
exclude the 'Gender' variable in this seperate datasheet using the drop command using the PROC step */
proc sort data=Names out=work.Male_names (drop=gender);
	by Name Count;
	where Gender='M';
run;
/* Q7. Here I add the variable 'Fraction' in the data set 'Male_names' by dividing
the 'Count' variable by the total number of male names (18477504) using the DATA step */
data Male_names;
	set Male_names;
	Fraction=Count/18477504;
run;
/* Q8. Here I sort the data set 'Male_names' by the variable 'Fraction', using the 'descending' command
to sort the values according to the variable 'Fraction' from the largest to the smallest using the PROC step */
proc sort data=Male_names;
	by descending Fraction;
run;
/* Q9. Here I print the data set 'Male_names' where the variable 'Fraction' that
each name takes up in the data set must be greater than 0.005 and I give it an according title using the PROC step */
proc print data=male_names;
	where Fraction > 0.005;
	title 'Male names that account for more than 0.5% of the dataset';
run;

