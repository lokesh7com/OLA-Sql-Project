create database ola;
use ola;

#1. Retrive all sucessful booking.

create view Successful_Bookings As
select * from booking
where Booking_Status = 'Success';
select * from Successful_Bookings;


#2. FInd the average ride distance for each vehicles type

create view ride_distance_for_each_vehicles As
select Vehicle_Type , avg(Ride_Distance) 
as avg_distance from booking
group by Vehicle_Type;

select * from ride_distance_for_each_vehicles;


#3. Get the total number of canceled ride by customers.

create view Canceled_Rides_by_Customers As
select count(*) from booking
where Booking_Status=  'Canceled by Customer';
select * from Canceled_Rides_by_Customers;

#4. List the top 5 customers who booked the highest number of rides.
create view Top_5_customers As
select Customer_ID, count(Booking_ID) as total_rides
from booking 
group by Customer_ID
order by total_rides DESC LIMIT 5;
select * from Top_5_customers;

#5. Get the number of rides canceled by drivers due to personal and car releated issues.
create view rides_canceled_by_drivers As
select count(*) from booking
where Canceled_Rides_by_Driver='personal & car related issue';
select * from rides_canceled_by_drivers;

#6. Find the minimum and maximum driver rating for prime sedan booking.
create view minimum_and_maximum_driver_rating As
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from booking  where  Vehicle_Type='Prime sedan';
select * from minimum_and_maximum_driver_rating;


#7. Retrive all rides where payment was made by UPI
create view UPI_payment As
select * from booking 
where Payment_Method='UPI';
select * from UPI_payment;

#8. Find the average customer rating per Vehicle type.
create view average_customer_rating As
select Vehicle_Type, avg(Customer_Rating) 
 from booking 
group by Vehicle_Type;
select * from average_customer_rating;

#9. Calculate the total booking value of ride completed successfully.
create view total_booking_value As
select sum(Booking_Value)
from booking where Booking_Status='Success';
select * from total_booking_value;

#10. List all incomplete ride along with the reason
create view Incomplete_ride_reason As
select Booking_ID,Incomplete_Rides_Reason 
from booking where Incomplete_Rides='yes';
select * from Incomplete_ride_reason;