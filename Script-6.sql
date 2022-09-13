 CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"ticket_id" integer NOT NULL,
	"payment" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);

--we added the ticket id to the customer because they purchase the ticket and have it assigned to them 

CREATE TABLE "concession" (
	"con_id" serial NOT NULL,
	"food_drink" varchar(255) NOT NULL,
	"price" money NOT NULL,
	"customer_id" money NOT NULL,
	CONSTRAINT "concession_pk" PRIMARY KEY ("con_id")
) WITH (
  OIDS=FALSE
);
-- customer is the one buying the food so they have it assigned to them 


CREATE TABLE "ticket" (
	"ticket_id" serial NOT NULL,
	"ticket_cost" money NOT NULL,
	"movie_id" money NOT NULL,
	"show_time" TIME NOT NULL,
	CONSTRAINT "ticket_pk" PRIMARY KEY ("ticket_id")
) WITH (
  OIDS=FALSE
);
--movie id and show timeis assigned because we need the movie info for the ticket 


CREATE TABLE "movie" (
	"movie_id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"showtime" TIME NOT NULL,
	CONSTRAINT "movie_pk" PRIMARY KEY ("movie_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "theater" (
	"theatre_id" serial NOT NULL,
	"movie_id" integer NOT NULL,
	"ticket_id" integer NOT NULL,
	"theatre_number" varchar(255) NOT NULL,
	CONSTRAINT "theater_pk" PRIMARY KEY ("theatre_id")
) WITH (
  OIDS=FALSE
);

--we did the movie and ticket id because we need to know which movie is assigned to which theatre and how many tickets have been sold 

ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("ticket_id");

ALTER TABLE "concession" ADD CONSTRAINT "concession_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk1" FOREIGN KEY ("show_time") REFERENCES "movie"("showtime");


ALTER TABLE "theater" ADD CONSTRAINT "theater_fk0" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id");
ALTER TABLE "theater" ADD CONSTRAINT "theater_fk1" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("ticket_id");


