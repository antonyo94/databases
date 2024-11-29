# Databases

## 🛠 Skills
- SQL
- Oracle DB
- Database Modeling

## 📝 Requirements
*We want to automate the management of a local football school, for which information regarding the registered office, club colors and various contact details is already known. The school foresees the enrollment of children aged between 5 and 14 years of whom we want to memorize the football card number that identifies them, name, surname, date of birth and address. Since they are children, it will also be necessary to keep the personal information of one or more parents and the various telephone numbers for possible contacts. For each student, we then want to memorize the payments he makes by recording the date and the amount due, which is fixed at a given amount of money, but may be subject to discounts based on some discounts offered by the company. A payment can only be received by managers who are part of the administrative department or hold the role of president of the Football School. The personal information of each manager must therefore be stored, in addition to the role held, the sector to which he belongs and his date of hiring. To stimulate the players, it is ensured that they will have to earn a starting place in their own category, identified by a name and age of the participants. In order to identify the best ones who will be starters, information is kept regarding the training sessions undertaken by a single member, such as the role he played in the individual sessions and the grade given to him by the coach. Each training session, which lasts a maximum of two hours, is in fact led by a qualified instructor, recognized by his license number. In this way the football school allows the coaches to directly manage the various categories and students from a sporting point of view, even if a coach who is too young or not adequately qualified is not allowed to coach certain categories. Having only one field available, each training session is identified by a unique date and time, it will therefore not be possible for two teams to train at the same time or before a previous session is finished, in addition to not allowing training sessions to take place on two subsequent days. The operations required include automating the entry of payments and training sessions undertaken by the students, updating the teams with instructors and members, as well as facilitating the tasks of the coaches, planning the various training sessions and automatically calculating the best starters for any matches considering the average scores of the last month of training. Necessary constraints concern holidays, in fact there are no payments or training on Saturdays or Sundays, in addition to checks on the age of members who play in a category. Finally, the company reserves the right to protect the instructors by ensuring that they do not work more than three days a week and do not train more than three teams.*

## 📖 Lessons Learned
The project allowed me to proceed in a practical way with the collection of requirements directly from the customer, aimed at:
  - Creating a conceptual **ER model** and subsequently a **relational model** to form the logical foundations for the database implementation.

So I was able to:
  - Define the users who interact with the database.
  - Outline the use cases and the sequence diagrams.

From a practical implementation perspective:
  - Independently created the **DDL statements** for table creation, including:
    - Importing **PKs**, **FKs**, and other **CONSTRAINTs** or integrity constraints.
  - Wrote scripts to:
    - Populate the database.
    - Create the **USERS** who access the system, with the assignment of their respective **GRANTs**.
  - Associated a **Trigger system** with the database, such as logging users who access the database.
  - Implemented:
    - Basic functions for simple mathematical operations.
    - Procedures for more complex operations, which may also modify the database.
    - **Views** to:
      - Simplify access to data in complex queries.
      - Control user access by exposing only necessary data.
  - Included **DROP scripts** for the various entities and the database itself.

During the implementation of the database we tried to preserve compliance with the first, second and third normal forms, respectively:
  - **First Normal Form (1NF):**
    - Ensured no repeated columns (atomic attributes) in database tables.
  - **Second Normal Form (2NF):**
    - Ensured tables in 1NF where all columns depended on the entire primary key (not a part of it).
  - **Third Normal Form (3NF):**
    - Ensured tables in 2NF where all non-key attributes depended only on the primary key, avoiding dependencies on other non-key attributes.
