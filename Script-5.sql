INSERT INTO movie (title, description, showtime)
VALUES
	('Hulk', 'Big green dude', '0800');
	
INSERT INTO ticket (ticket_cost, movie_id, show_time)
VALUES
	(14.99, 1, 1);
	
INSERT INTO theatre (movie_id, ticket_id, theatre_number)
VALUES
	(1, 1, '5');
	
INSERT INTO customer (ticket_id, payment)
VALUES
	(1, 'cash');
	
INSERT INTO concession (customer_id, food_drink, price)
VALUES
	(1, 'coke', 4.50);