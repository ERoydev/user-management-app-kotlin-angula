-- 1. Create the user (role)
DO
$$
BEGIN
   -- Check if the role (user) exists, and drop it if it does (optional)
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'your_username') THEN
      PERFORM pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = 'usermanagement'
      AND pid <> pg_backend_pid(); -- Terminate active connections

      DROP ROLE your_username;
   END IF;

   -- Create the role (user) with login privileges
   CREATE ROLE your_username WITH LOGIN PASSWORD 'your_password';
END
$$;

-- 2. Create the database outside the DO block (CREATE DATABASE cannot run inside a DO block)
CREATE DATABASE usermanagement OWNER your_username;

-- 3. Grant privileges to the new user (in case more privileges are needed later)
GRANT ALL PRIVILEGES ON DATABASE usermanagement TO your_username;

-- 4. Connect to the newly created database
\c usermanagement;

-- 5. Create the users table inside the newly created database
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'users') THEN
      CREATE TABLE users (
          id SERIAL PRIMARY KEY,
          first_name VARCHAR(100) NOT NULL,
          last_name VARCHAR(100) NOT NULL,
          date_of_birth DATE NOT NULL,
          phone_number VARCHAR(12) NOT NULL,
          email VARCHAR(100) UNIQUE NOT NULL
      );
   END IF;
END
$$;

-- 6. Alter table ownership (this ensures the user becomes the owner of the table)
ALTER TABLE users OWNER TO your_username;

insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Niels', 'MacGilpatrick', '1/29/2003', '502-144-1154', 'nmacgilpatrick0@usatoday.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Griffy', 'Matijasevic', '1/14/2015', '128-276-6848', 'gmatijasevic1@gnu.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Jessica', 'De Bischop', '12/22/2001', '444-947-8823', 'jdebischop2@alibaba.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Giles', 'Pickrill', '12/20/2008', '948-882-2426', 'gpickrill3@creativecommons.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Livvie', 'Wingar', '4/3/2020', '123-749-0646', 'lwingar4@tamu.edu');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Grace', 'Gentsch', '5/2/2004', '574-735-7443', 'ggentsch5@nba.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Minne', 'Laboune', '6/24/2009', '815-218-0870', 'mlaboune6@ed.gov');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Jackqueline', 'Marvin', '5/4/2006', '910-528-2352', 'jmarvin7@bloglovin.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Rodrigo', 'Exrol', '1/9/2001', '266-960-7696', 'rexrol8@dedecms.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Madelene', 'Stut', '3/10/2006', '983-397-8020', 'mstut9@myspace.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Lombard', 'Fewell', '8/7/2001', '739-821-4148', 'lfewella@imageshack.us');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Caterina', 'Gallelli', '1/11/2020', '305-548-5455', 'cgallellib@hugedomains.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ezequiel', 'Delnevo', '7/15/2015', '374-545-9437', 'edelnevoc@dedecms.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Herb', 'Vedishchev', '10/30/2014', '664-858-4451', 'hvedishchevd@free.fr');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ximenez', 'Reide', '5/28/2012', '914-264-8723', 'xreidee@sakura.ne.jp');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Warde', 'Murrie', '1/29/2013', '788-245-4546', 'wmurrief@chicagotribune.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Berkeley', 'Harriott', '11/19/2004', '238-998-0999', 'bharriottg@seesaa.net');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Berke', 'Halle', '5/5/2011', '508-331-9974', 'bhalleh@rakuten.co.jp');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Anabelle', 'Bartol', '1/26/2003', '756-934-6027', 'abartoli@fema.gov');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Roxi', 'Giraldez', '5/7/2001', '674-898-0077', 'rgiraldezj@geocities.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Beatrisa', 'Sinkins', '11/25/2006', '412-200-4875', 'bsinkinsk@hexun.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Archy', 'Brookfield', '1/18/2001', '685-588-9403', 'abrookfieldl@ibm.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Rosamund', 'Surr', '12/10/2001', '779-708-4242', 'rsurrm@narod.ru');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Franni', 'Drane', '2/11/2007', '562-105-1900', 'fdranen@github.io');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Winny', 'Bassano', '2/24/2020', '189-276-1453', 'wbassanoo@foxnews.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Piotr', 'Soans', '11/14/2007', '111-212-8831', 'psoansp@alibaba.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Kiel', 'Lasslett', '7/24/2004', '490-455-2566', 'klasslettq@buzzfeed.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Glori', 'Headey', '1/22/2012', '201-206-8520', 'gheadeyr@facebook.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Julius', 'Fawthorpe', '6/3/2013', '267-881-6364', 'jfawthorpes@economist.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Haleigh', 'Kimbrey', '11/20/2004', '916-419-9758', 'hkimbreyt@constantcontact.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Bary', 'Southerill', '6/1/2007', '411-183-1830', 'bsoutherillu@intel.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Hali', 'Furness', '4/30/2019', '259-612-4246', 'hfurnessv@paypal.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Eldridge', 'Danev', '9/9/2014', '828-350-6787', 'edanevw@buzzfeed.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Nolly', 'Pellew', '2/21/2003', '497-905-5075', 'npellewx@wufoo.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Rudyard', 'Carver', '10/16/2003', '748-222-2364', 'rcarvery@shop-pro.jp');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ariel', 'Maffi', '5/11/2003', '361-921-5871', 'amaffiz@google.co.jp');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Jojo', 'Dacres', '5/30/2017', '407-469-0540', 'jdacres10@odnoklassniki.ru');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Danni', 'Tamlett', '2/13/2001', '308-833-7003', 'dtamlett11@marriott.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Verne', 'Cogle', '7/21/2014', '354-748-6665', 'vcogle12@cdbaby.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Florian', 'Abbis', '1/14/2006', '552-316-8350', 'fabbis13@hugedomains.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Donal', 'Joney', '10/23/2010', '652-382-0097', 'djoney14@example.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Lucias', 'Colhoun', '9/29/2012', '571-740-4227', 'lcolhoun15@zimbio.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Louisette', 'Pfertner', '1/11/2002', '169-418-4834', 'lpfertner16@dmoz.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Vicki', 'Stryde', '12/21/2013', '511-113-1032', 'vstryde17@opensource.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Dacy', 'Gomes', '4/9/2005', '851-166-6780', 'dgomes18@loc.gov');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Fanny', 'D''Costa', '4/22/2008', '855-621-4795', 'fdcosta19@phoca.cz');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Elmira', 'Gillogley', '2/18/2009', '597-650-6315', 'egillogley1a@xrea.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ward', 'Scutter', '10/24/2015', '136-956-0640', 'wscutter1b@mashable.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Bartlet', 'Spalls', '8/27/2007', '218-684-5512', 'bspalls1c@livejournal.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Timmie', 'Pollak', '9/12/2012', '901-975-0199', 'tpollak1d@google.fr');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Danny', 'Spieght', '8/12/2006', '412-494-4077', 'dspieght1e@nbcnews.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Harper', 'Klimek', '7/10/2020', '571-256-5370', 'hklimek1f@google.it');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Sigismund', 'Abrey', '3/12/2002', '800-602-9978', 'sabrey1g@goo.gl');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Lorenza', 'Feighry', '1/3/2011', '608-343-0496', 'lfeighry1h@com.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Audrye', 'Bottom', '1/10/2018', '351-100-1672', 'abottom1i@bandcamp.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Marillin', 'Bulman', '5/15/2003', '139-500-2947', 'mbulman1j@icio.us');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Shelley', 'Cord', '5/5/2016', '188-251-6812', 'scord1k@sina.com.cn');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Edie', 'Livzey', '7/3/2020', '872-257-9792', 'elivzey1l@blog.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Fletch', 'Phillput', '8/7/2020', '332-759-9190', 'fphillput1m@scribd.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Sauncho', 'Flockhart', '12/21/2013', '792-789-6338', 'sflockhart1n@xrea.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Wainwright', 'Lockney', '9/8/2013', '750-853-5749', 'wlockney1o@blogs.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Gratia', 'Athowe', '8/2/2001', '153-752-8549', 'gathowe1p@dell.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Basilius', 'Mackinder', '12/24/2012', '599-568-6622', 'bmackinder1q@wiley.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Natal', 'Welsh', '12/3/2003', '758-485-9864', 'nwelsh1r@forbes.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ebeneser', 'Huxham', '10/13/2000', '154-539-4783', 'ehuxham1s@behance.net');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Nalani', 'Joannet', '12/30/2002', '204-701-1109', 'njoannet1t@parallels.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Blinni', 'Mumbeson', '5/10/2008', '824-756-8798', 'bmumbeson1u@pinterest.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Adoree', 'Tokell', '9/24/2004', '745-697-7400', 'atokell1v@ted.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Lottie', 'Kield', '9/13/2011', '249-284-1975', 'lkield1w@hao123.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Saunder', 'Tenny', '11/22/2013', '272-915-8895', 'stenny1x@youku.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Hewet', 'Shirtliff', '3/19/2001', '565-345-7196', 'hshirtliff1y@weibo.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Clea', 'Dibben', '10/6/2016', '573-799-6297', 'cdibben1z@ebay.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Gilbertina', 'Deppe', '4/21/2004', '930-639-9754', 'gdeppe20@examiner.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Packston', 'Verny', '9/25/2004', '369-950-5864', 'pverny21@uol.com.br');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Shawnee', 'Baigrie', '4/2/2004', '787-899-3067', 'sbaigrie22@jiathis.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Tabbitha', 'McRobbie', '10/7/2004', '670-397-8763', 'tmcrobbie23@skyrock.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Andrea', 'Whorall', '3/27/2005', '109-280-4278', 'awhorall24@1und1.de');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Clementius', 'Cowthard', '4/1/2010', '238-938-4141', 'ccowthard25@epa.gov');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Cilka', 'Trebble', '2/16/2014', '485-787-9441', 'ctrebble26@buzzfeed.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Madge', 'Wailes', '8/16/2001', '482-456-1939', 'mwailes27@zdnet.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Antoinette', 'Grishukov', '2/20/2004', '873-855-8963', 'agrishukov28@independent.co.uk');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Brad', 'Volet', '1/19/2008', '150-665-5212', 'bvolet29@japanpost.jp');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Saul', 'Sloley', '9/28/2010', '445-934-3237', 'ssloley2a@auda.org.au');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Stephi', 'Hemerijk', '9/14/2011', '716-440-5353', 'shemerijk2b@hp.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Chev', 'Lyenyng', '8/23/2012', '248-964-5069', 'clyenyng2c@dyndns.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Alica', 'Malden', '12/16/2015', '812-805-3407', 'amalden2d@amazonaws.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Esra', 'Barnham', '7/15/2007', '862-554-4512', 'ebarnham2e@youtube.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Annecorinne', 'Whapple', '11/23/2004', '696-370-5454', 'awhapple2f@wsj.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Andee', 'Eckley', '8/31/2010', '505-246-3837', 'aeckley2g@theglobeandmail.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Eustacia', 'Gahan', '3/12/2010', '968-398-3961', 'egahan2h@howstuffworks.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ester', 'Lesper', '11/30/2000', '136-379-5001', 'elesper2i@nytimes.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Reece', 'Binden', '4/2/2016', '823-393-7337', 'rbinden2j@usda.gov');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Clement', 'Fitzpatrick', '8/24/2003', '729-166-4271', 'cfitzpatrick2k@home.pl');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Ennis', 'Estabrook', '9/4/2007', '635-428-0031', 'eestabrook2l@bandcamp.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Nico', 'Thaxton', '8/19/2012', '909-942-6831', 'nthaxton2m@rambler.ru');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Jonas', 'Plumm', '3/31/2008', '803-204-0469', 'jplumm2n@redcross.org');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Mohandas', 'Antrobus', '12/30/2001', '526-454-7246', 'mantrobus2o@engadget.com');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Thia', 'McVee', '1/5/2004', '494-920-3307', 'tmcvee2p@clickbank.net');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Boony', 'Thurborn', '1/4/2018', '992-694-0772', 'bthurborn2q@washington.edu');
insert into users (first_name, last_name, date_of_birth, phone_number, email) values ('Gabi', 'Lorait', '11/29/2008', '144-956-3757', 'glorait2r@ed.gov');
