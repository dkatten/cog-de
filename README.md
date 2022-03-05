# Northwind Database

The northwind database is a sample database created by Microsoft
for demonstrating the capabilities of their SQL Server (aka MSSQL).

It is an example of the type of CRM database you might see in the future.

## Building and running

1. Build the docker image with `docker build -t northwind:1.0.0 .`
2. Run the image and expose the postgres port with `docker run -p 5432:5432 northwind:1.0.0`

This will run the server in foreground mode. Add `-d` to daemonize and run the image in the background.

3. Connect via a terminal with `psql -U postgres -h localhost` and enter a password of `postgres`

You are now connected to the northwind database to explore.