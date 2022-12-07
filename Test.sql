--Q1--

select ProductName from Products where UnitPrice between 30 and 40

--Q2--

select ProductName from Products where CategoryID=2

--Q3--

select ProductName from Products P
inner join Categories C on
C.CategoryID=P.CategoryID 
where CategoryName like '%s%'

--Q4--
select distinct ProductName from Products P
inner join [Order Details] Od on P.ProductID=Od.ProductID
inner join Orders O on Od.OrderID=O.OrderID
inner join Customers C on O.CustomerID=C.CustomerID
where   C.CustomerID   like 'ALFKI'

--Q5--
select OrderID from Orders where ShipCity like 'London' or ShipCountry like 'Brazil'


--Q6--
select CustomerID from Orders where ShipVia=3

--Q7--
create procedure ex7
@NumberOrder int
as
begin
select P.ProductName,P.UnitPrice from Orders O
inner join [Order Details] Od on O.OrderID=Od.OrderID
inner join Products P on P.ProductID=Od.ProductID
where O.OrderID=@NumberOrder

end
exec ex7 @NumberOrder='10262'
go

drop procedure ex7

--Q8--
select * from Orders where ShipVia=1
and(EmployeeID=2 or EmployeeID=5)
and(CustomerID like 'B%')

--Q9--
select Od.*,O.OrderDate,O.EmployeeID,O.CustomerID from [Order Details] Od 
inner join Orders O on O.OrderID = Od.OrderID
or O.OrderID != Od.OrderID
where Od.OrderID = 10248 and O.CustomerID like 'VINET'
order by UnitPrice,O.EmployeeID


--Q10--
select CustomerID,Region,country from Customers
where (Country like 'Canada') or (Country like 'France')
