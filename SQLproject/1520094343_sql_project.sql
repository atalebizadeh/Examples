/* Welcome to the subqL mini project. For this project, you will use
Springboard' online subqL platform, which you can log into through the
following link:

https://subql.springboard.com/
Username: student
Password: learn_subql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT name, membercost
FROM Facilities
WHERE membercost > 0


/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT( * )
FROM Facilities
WHERE membercost = 0


/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT	facid, 
		name,
		membercost,
		monthlymaintenance
FROM Facilities
WHERE membercost > 0
AND membercost < (.20 * monthlymaintenance)


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT *
FROM Facilities
WHERE facid IN (1,5)


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT	name,
		monthlymaintenance,
CASE 
	WHEN monthlymaintenance > 100 THEN "Expensive"
	ELSE "Cheap"
END AS Pricing_Group
FROM Facilities


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT  firstname,
		surname,
		joindate
FROM Members
WHERE joindate = (SELECT MAX(joindate) FROM Members)


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT DISTINCT	f.name AS Facility_names,
				CONCAT(m.firstname,' ',m.surname) AS Member_names
	FROM Bookings b
	JOIN Members m ON b.memid = m.memid
	AND m.memid > 0 -- To select all members only
	JOIN Facilities f ON b.facid = f.facid	
WHERE b.facid < 2 -- To select tennis courts
ORDER BY 2


/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT  f.name as facility_name,
		CONCAT(m.firstname,' ',m.surname) AS Member_names,
CASE
	WHEN b.memid = 0 THEN (b.slots * f.guestcost) -- To calculate the total cost for guests
	ELSE (b.slots * f.membercost) -- To calculate the total cost for members (if memid is not 0, then they are members)
END AS cost
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
	 AND b.starttime LIKE '2012-09-14%' -- To select the day of 2012-09-14
JOIN Members m ON b.memid = m.memid
	WHERE 	(CASE 
				WHEN b.memid = 0 THEN (b.slots * f.guestcost)
				ELSE (b.slots * f.membercost)
			END) > 30
ORDER BY 3 DESC


/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT  subq.facility_name,
		CONCAT(m.firstname,' ',m.surname) AS Member_names,
		subq.cost
FROM Members m
JOIN (SELECT f.name as facility_name,
			b.memid as memid,
			CASE
				WHEN b.memid = 0 THEN (b.slots * f.guestcost)
				ELSE (b.slots * f.membercost)
			END AS cost		
	FROM Bookings b
	JOIN Facilities f ON b.facid = f.facid
	AND b.starttime LIKE '2012-09-14%') subq	ON m.memid = subq.memid
WHERE subq.cost > 30
ORDER BY 3 DESC


/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT f.name AS facility_name,
       subq1.total_revenue
FROM Facilities f
JOIN (
    SELECT f.facid as facid,
			sum(CASE
					WHEN subq2.user_type = 'Guest' THEN subq2.total_slots * f.guestcost
                    ELSE subq2.total_slots * f.membercost
				END) AS total_revenue
    FROM Facilities f
    JOIN (
        SELECT 	f.facid AS facid,
				CASE 
					WHEN b.memid = 0 THEN 'Guest' 
					ELSE 'Member' 
				END AS user_type,
               sum(b.slots) AS total_slots
        FROM Bookings b
        JOIN Facilities f ON b.facid = f.facid
        GROUP BY facid, user_type
    ) subq2 ON f.facid = subq2.facid
    GROUP BY 1
) subq1 ON f.facid = subq1.facid
WHERE subq1.total_revenue < 1000
ORDER BY 2
