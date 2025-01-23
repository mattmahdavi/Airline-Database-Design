
/*1.	Get the average ticket price for flights flying to or from DFW airport*/

SELECT AVG (BasePrice) AS AverageTicketPrice
FROM Flight
WHERE DepartureAirportID='DFW' OR ArrivalAirportID='DFW'

/*2.	Count of Veg meals on flightID 'F001'*/

select Count (*) as NumberofVegMeals 
from Catering
where MealType like 'Veg%' 
and flightID = 'F001';
 
/*3.	Retrieve the list of all catering orders for a specific flight.*/

SELECT MealType
FROM Catering
WHERE FlightID = 'F001';

/*4.	Retrieve the list of all baggage orders for a specific ticket.*/

SELECT  BaggageID, BaggageWeight, BaggageFees 
FROM Baggage
WHERE TicketID = 'T003';

/*5.	Retrieve the total number of tickets purchased each day in the month of 
April 2023, along with the corresponding dates.*/

SELECT DateOfPurchase, COUNT(*) AS TotalTicketsPurchased
FROM Ticket
WHERE DateOfPurchase >= '2023-04-01' 
AND DateOfPurchase <= '2023-04-30'
GROUP BY DateOfPurchase;

/*6.	Find the number of tickets purchased for each flight*/

SELECT td.FlightID, COUNT(*) AS NumTickets
FROM TripDetails td
GROUP BY td.FlightID

/*7.	Get the average price of meals served on each flight:*/

SELECT FlightID, AVG(Price) AS AvgMealPrice
FROM Catering
GROUP BY FlightID;

/*8.	Retrieve the list of tickets purchased by customers who have also 
purchased tickets on the same day as the customer with CustID 'C012'.*/

SELECT *
FROM Ticket
WHERE DateOfPurchase IN (
    SELECT DateOfPurchase
    FROM Ticket
    WHERE CustID = 'C012'
)
AND CustID <> 'C012';

/*9.	Show the number of tickets sold for each meal type, along 
with the total revenue generated from catering orders for that meal type.*/

SELECT MealType, COUNT(*) AS NumTicketsSold, SUM(Price) AS TotalCateringRevenue
FROM Catering
GROUP BY MealType;

/*10.	Retrieve the list of all customers who have purchased 
a ticket for a flight with a American airline (Inner Join)*/

SELECT CustFirstName, CustLastName
FROM Customer
INNER JOIN Ticket ON Customer.CustID = Ticket.CustID
INNER JOIN TripDetails ON Ticket.TicketID = TripDetails.TicketID
INNER JOIN Flight ON TripDetails.FlightID = Flight.FlightID
WHERE Flight.AirlineID = 'AA';

/*11.	Retrieve the list of all customers who have purchased a ticket for a flight with a specific airline. (Subquery) */

SELECT CustFirstName, CustLastName 
FROM Customer, TripDetails, Flight, Ticket
where Customer.CustID = Ticket.CustID
and Ticket.TicketID = TripDetails.TicketID
and TripDetails.FlightID = Flight.FlightID
and Flight.AirlineID = 'AA';
 
/*12.	Retrieve the list of all customers who have purchased a ticket for a specific  flight (AA001) */

SELECT CustFirstName, CustLastName, Flight.FlightNumber
FROM Customer, Ticket, TripDetails, Flight
WHERE Customer.CustID = Ticket.CustID
and Ticket.TicketID = TripDetails.TicketID
and TripDetails.FlightID = Flight.FlightID
and Flight.FlightNumber = 'AA001';

/*13.	Flight details (Airline, FlightNumber, DepartureAirportID, DepartureDateTime, ArrivalAirportID, ArrivalDateTime, FlightDuration, BasePrice) 
between DFW & ORD on Apr 23?*/

Select AirlineID, FlightNumber,  DepartureAirportID, DepartureDateTime, ArrivalAirportID, ArrivalDateTime, FlightDuration, BasePrice 
from flight
where DepartureAirportID = 'DFW' 
and ArrivalAirportID = 'ORD' 
and (DepartureDateTime between '2023-04-23 00:00:00.000' and '2023-04-24 00:00:00.000');
 
/*14.	What are the Travel dates and details (From & To) for customer John Doe */

Select customer.CustFirstName, customer.CustLastName, Flight.FlightNumber, Flight.DepartureAirportID, Flight.DepartureDateTime, Flight.ArrivalAirportID
from customer, Ticket, TripDetails, Flight
where CustFirstName = 'John' and CustLastName = 'Doe'
And customer.CustID = Ticket.CustID
And Ticket.TicketID = TripDetails.TicketID
And TripDetails.FlightId = Flight.FlightId;
 
/*15.	How much money John Doe spent on his flight?*/

Select customer.CustFirstName, customer.CustLastName, Flight.BasePrice as FlightPrice, Insurance.Premium as InsurancePremium, Baggage.BaggageFees as BaggageFees, Catering.Price as MealPrice, Flight.BasePrice + Insurance.Premium + Baggage.BaggageFees + Catering.Price as TotalPrice
from customer, Ticket, TripDetails, Flight, Insurance, Baggage, Catering
where CustFirstName = 'John' and CustLastName = 'Doe'
And customer.CustID = Ticket.CustID
And Ticket.TicketID = TripDetails.TicketID
And TripDetails.FlightId = Flight.FlightId
And Insurance.TicketID = TripDetails.TicketID
And Baggage.TicketID = TripDetails.TicketID
And Catering.TicketID = TripDetails.TicketID;
 
/*16.	Retrieve the list of all customers who have purchased insurance for 
a flight from Southwest Airlines (Inner Join)*/

SELECT CustFirstName, CustLastName, Flight.AirlineID  
FROM Customer
INNER JOIN Ticket ON Customer.CustID = Ticket.CustID
INNER JOIN TripDetails ON Ticket.TicketID = TripDetails.TicketID
INNER JOIN Insurance ON TripDetails.FlightID = Insurance.FlightID AND TripDetails.TicketID = Insurance.TicketID
INNER JOIN Flight ON TripDetails.FlightID = Flight.FlightID
WHERE Flight.AirlineID = 'SW';

/*17.	Retrieve the list of all customers who have purchased insurance for a specific flight (AA001) (SubQuery)*/

SELECT CustFirstName, CustLastName, Flight.AirlineID, TripDetails.TicketID, Insurance.Premium
FROM Customer, Ticket, TripDetails, Insurance, Flight
Where customer.CustID = Ticket.CustID
And Ticket.TicketID = TripDetails.TicketID
And TripDetails.FlightId = Flight.FlightId
And Insurance.TicketID = TripDetails.TicketID
And Flight.FlightNumber = 'AA001';

/*18.	 Retrieve the full name, date of birth, and nationality of male customers flew with American Airline and used Visa credit card fot the ticket*/

SELECT Customer.CustFirstName, Customer.CustLastName, DOB, Nationality
FROM Customer, Ticket, TripDetails, Flight, Payment
WHERE Customer.CustID=Ticket.CustID
AND TICKET.TicketID=TripDetails.TicketID
AND TripDetails.FlightID=Flight.FlightID
AND Customer.CustID=Payment.CustID
AND Gender ='Male'
AND AirlineID='AA'
AND CardType='Visa'
 
/*19.	Retrieve the top three airline which generated the most revenue with the total amount of money including baggage, insurance, and meal (Six tables)*/

 SELECT TOP 3 AirlineName, SUM(BasePrice+Price+BaggageFees+Premium) AS TotalRevenue
 FROM Flight 
 INNER JOIN Airline ON Flight.AirlineID=Airline.AirlineID
 INNER JOIN TripDetails ON Flight.FlightID=TripDetails.FlightID
 INNER JOIN Ticket ON TripDetails.TicketID = Ticket.TicketID
 LEFT JOIN Catering ON TripDetails.TicketID = Catering.TicketID AND TripDetails.FlightID=Catering.FlightID
 LEFT JOIN Baggage ON TripDetails.TicketID = Baggage.TicketID AND TripDetails.FlightID=Baggage.FlightID
 LEFT JOIN Insurance ON TripDetails.TicketID = Insurance.TicketID AND TripDetails.FlightID=Insurance.FlightID
 GROUP BY Airline.AirlineName
 ORDER BY TotalRevenue DESC ;


 /*20.	Retrieve the name of the cities that British passengers Flight from? */

 SELECT AirportCity
 FROM Airport, Flight, TripDetails, Ticket, Customer
 WHERE Airport.AirportID = Flight.DepartureAirportID
 AND Flight.FlightID=TripDetails.FlightID
 AND Ticket.TicketID=TripDetails.TicketID
 AND Ticket.CustID=Customer.CustID
 AND Nationality='British'
 
 /*21.	Which airline does not have any flights? */

 SELECT AirlineName
 FROM AIRLINE
 WHERE AirlineID NOT IN (SELECT DISTINCT Airline.AirlineID
						 FROM Airline
						 RIGHT JOIN Flight ON Airline.AirlineID=Flight.AirlineID);


/*22.  Retrive the name of cusomers who ordered Vegetarian foods? */

SELECT CustFirstName, CustLastName
FROM Customer, Ticket, TripDetails, Catering
WHERE Customer.CustID=Ticket.CustID
AND Ticket.TicketID=TripDetails.TicketID
AND TripDetails.TicketID=Catering.TicketID
AND MealType='Vegetarian'
