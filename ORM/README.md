### ORM-Toybox

---

This repository is a collection of java programs to demonstrate some of the different approaches to bridging the object-relational gap. It has been uploaded to github to demonstrate technologies like MyBatis, JDBC, and others to a senior-level university database class.

---

#### Read This First

The textbook slides (Chapter 8 : Applications and Chapter 14 : ORM) give some
background information, but not enough. Please read this short documents :

[Hibernate ORM Overview] (http://hibernate.org/orm/what-is-an-orm/)

[MyBatis Overview] (https://www.tutorialspoint.com/mybatis/mybatis_overview.htm)

---

#### Git

You already know something about **git** if you are reading this document. It is hosted on Github. You will need clone it with the following command :

```git clone https://gitlab.pcs.cnu.edu/cpsc440-01-MrJohnson/ORM.git```

A guide to using git on the command-line follows. It is worth taking the time to master this tool.

[Git CL Guide] (http://rogerdudler.github.io/git-guide/)

[ORM-Toybox] (https://gitlab.pcs.cnu.edu/cpsc440-01-MrJohnson/ORM)

---

#### The Code

The Java code contains a simple demo of JDBC and MyBatis.

---

#### The Database

The code requires a running PostgreSQL database. The database host, database name, username, and password are hardcoded in **mybatis-confix.xml** and **JDBCDemo.java**. The SQL script **customerInvoice.sql** needs to be run on the database before running any of the Java programs.

---

#### Eclipse / Java Dependencies

You must download two JAR files and add them to the build path of your 
Eclipse project.

[PostgreSQL JDBC Driver] (https://jdbc.postgresql.org/download.html)

Use the version of PostgreSQL appropriate to your installation and version 4.1
of the JDBC (both versions will be in the JAR filename).

[MyBatis] (https://mvnrepository.com/artifact/org.mybatis/mybatis/3.3.0)

Click *Download JAR**.
