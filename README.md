# Database connected webapp with Docker

In the project there are two Docker container on Vagrant virtual host. One with the database(postgresql) and one with a query webapplication running on tomcat, connected by environmental variables in the docker-composer file.

The project can work on different machines also. In this case you have to make some changes.
If you would like to run the database container on a separated machine you should give an IP address in it's Vagrantfile, or you should use the your database computers public IP address set in the docker-compose file's environmental variable.

The additional line in Vagrantfile, if you would like to use separately the containers:

    db.vm.network "private_network", ip: "EXAMPLE_IP"

This IP address should be written into the docker-compose file too 
    SPRING_DATASOURCE_URL=jdbc:postgresql://EXAMPLE_IP:5432/chinook

You can use the same docker- compose file on separated computers also, just only up one service.

`docker compose up db -d` or `docker-compose up web -d`

The app avaliable on tomcat's computer's localhost, but reserved words only works with capital letters.
  
~~select * from artist~~

     SELECT * FROM artist

!!!On linux system, you may have to change in the Vagratnfile the hosts port from 80 to something higher than 1024!!!

**Base requirements:**

 - git (https://git-scm.com/downloads)
 - Vagrant (https://www.vagrantup.com/downloads)
 - Virtualbox (https://www.virtualbox.org/wiki/Downloads)
 - Database sample - https://github.com/lerocha/chinook-database/tree/master/ChinookDatabase/DataSources