-- credentials (13 pair -> 1 admin + 9 managers + 21 clients)
INSERT INTO credentials (login, password)
VALUES ('Ratliff', 'WIB49ZZY3KT')
     , ('Hendrix', 'TDP13CJO6DM')
     , ('Lane', 'LOL59CUF7TV')
     , ('Schwartz', 'HUI44CUY5SF')
     , ('Hampton', 'LJC72DQK2QT')
     , ('Fry', 'ESI07WRG1YX')
     , ('Mcknight', 'DQW25KGB3LM')
     , ('Justice', 'LIY17PYA4YH')
     , ('Snider', 'KMC50ALM0JD')
     , ('Odom', 'SNY82PCG3VL')
     , ('Potter', 'NBM52LVE8MQ')
     , ('Lang', 'VNB43JLX5MR')
     , ('Donaldson', 'ZNO83JPU2CN')
     , ('Gaines', 'OFD83RMJ8RB')
     , ('Franks', 'DPC74GXQ1JM')
     , ('Herman', 'WYR45FRG3VQ')
     , ('Fitzgerald', 'QYY37QDK2NX')
     , ('Hansen', 'KHM89PJO3UA')
     , ('Chapman', 'UXA10QHM7KU')
     , ('Love', 'YYL75DEW3KW')
     , ('Nelson', 'DXC53HEG7FS')
     , ('Christensen', 'CZE85QGR2XG')
     , ('Conway', 'MMS74OBO8HQ')
     , ('Miranda', 'UOQ84EYM3KT')
     , ('Beach', 'TCC47JYT6ZC')
     , ('Ingram', 'DYJ61QWQ3LG')
     , ('Cherry', 'KGE16XRV5YF')
     , ('Wyatt', 'SXC15LPF1JQ')
     , ('Cabrera', 'JOS36QQR5ME')
     , ('Lane', 'WVT51RPL7YV')
     , ('Lateki', 'JOS36QR5ME');

-- office and region insertions
INSERT INTO regions (region_name)
VALUES ('Ulster'),
       ('Ivano-Frankivsk oblast'),
       ('Friesland');

INSERT INTO cities (region, name, description)
VALUES (3, 'Lozova', '')
     , (2, 'Cao Bằng', '')
     , (1, 'Columbia', '');

INSERT INTO offices (city_id, address, description)
VALUES (1, '4362 Ac Rd.', '')
     , (2, '694-3990 In, St.', '')
     , (3, '643-6107 Neque. Avenue', '');

-- roles insertions
INSERT INTO admin (full_name, credentials)
VALUES ('admin', 1);

INSERT INTO personal_managers (full_name, is_active, credentials, office)
VALUES ('Jael Carpenter', true, 2, 2)
     , ('Sophia Conner', false, 3, 1)
     , ('Pearl Mcdowell', false, 4, 2)
     , ('Maryam Burnett', true, 5, 2)
     , ('Cecilia Odom', false, 6, 3)
     , ('Tamekah Howard', true, 7, 2)
     , ('Echo English', true, 8, 2)
     , ('Blossom Conner', false, 9, 3)
     , ('Troy Simon', true, 10, 1);

INSERT INTO passports (issued_at, issued_by, series, number, is_validated)
VALUES ('2021-02-12', 'Mexico', 1636, 710484, true)
     , ('2023-11-12', 'Mexico', 9613, 50579, false)
     , ('2022-03-12', 'Singapore', 1198, 675637, true)
     , ('2008-12-22', 'Brazil', 3525, 880845, true)
     , ('1997-04-12', 'Sweden', 8864, 828776, false)
     , ('2001-08-02', 'Australia', 5818, 911616, false)
     , ('2000-10-22', 'Chile', 7550, 17965, false)
     , ('2011-05-12', 'South Africa', 89, 14888, true)
     , ('2014-04-12', 'Nigeria', 1196, 507218, true)
     , ('2022-09-22', 'Russian Federation', 4419, 976037, true)
     , ('2012-01-12', 'Germany', 5037, 248748, false)
     , ('1996-04-12', 'Chile', 4827, 452445, true)
     , ('1995-11-12', 'Russian Federation', 6713, 461141, true)
     , ('2003-07-23', 'Poland', 5456, 789421, true)
     , ('2022-04-02', 'Russian Federation', 5128, 821343, false)
     , ('2009-02-12', 'Belgium', 6249, 829494, true)
     , ('2004-03-22', 'South Africa', 6114, 238384, false)
     , ('2015-10-02', 'Belgium', 1807, 275790, false)
     , ('1998-06-12', 'Sweden', 2382, 782475, false)
     , ('1999-07-12', 'Poland', 5815, 206720, true)
     , ('1997-09-12', 'South Korea', 3585, 168491, true);

INSERT INTO clients (address, birthday, full_name, is_active, passport, credentials, personal_manager)
VALUES ('Ap #262-8545 Risus Rd.', '2015-12-22', 'Blossom Espinoza', true, 1, 11, 6)
     , ('6824 Enim Avenue', '1999-06-13', 'Lacy Davis', true, 2, 12, 2)
     , ('Ap #755-4085 Ornare St.', '2023-04-01', 'Myra Walton', false, 3, 13, 7)
     , ('Ap #974-3847 Facilisis Avenue', '2004-08-22', 'Adria Booth', false, 4, 14, 1)
     , ('3517 Lacus. Av.', '2006-10-12', 'Ignatius Gordon', true, 5, 15, 7)
     , ('135-5691 Eu Rd.', '2020-03-02', 'Branden Webb', true, 6, 16, 5)
     , ('Ap #976-6741 Proin Ave', '1999-10-12', 'Elizabeth Sampson', false, 7, 17, 4)
     , ('Ap #361-4974 Consequat Street', '2015-03-02', 'Colt Hansen', true, 8, 18, 8)
     , ('887-5013 At Avenue', '1999-04-22', 'Rahim Hernandez', false, 9, 19, 3)
     , ('Ap #149-6057 Consequat Road', '1997-09-23', 'Quinlan Cannon', false, 10, 20, 5)
     , ('613-5999 Fringilla Ave', '2012-08-02', 'Irma Rowe', true, 11, 21, 3)
     , ('Ap #988-5976 Volutpat. Avenue', '1998-09-12', 'Lara Newman', false, 12, 22, 8)
     , ('454-7607 Mattis Avenue', '1993-02-12', 'Cullen Maddox', true, 13, 23, 8)
     , ('P.O. Box 443, 7174 Et Rd.', '2015-07-12', 'Carolyn O''connor', true, 14, 24, 7)
     , ('396-7291 Odio Avenue', '1998-12-22', 'Jackson Morales', true, 15, 25, 8)
     , ('P.O. Box 791, 6084 At Av.', '2014-02-22', 'Molly Daniel', true, 16, 26, 3)
     , ('263-3612 Ut Av.', '2015-09-12', 'Ulla Dyer', true, 17, 27, 5)
     , ('9012 Eleifend St.', '2016-10-22', 'Aladdin Morse', true, 18, 28, 4)
     , ('701-3444 Sapien Street', '2017-10-23', 'Zephania Meadows', true, 19, 29, 6)
     , ('Ap #875-208 Euismod Av.', '2004-08-02', 'Knox Andrews', false, 20, 30, 9)
     , ('Ap #208 Euismod Av.', '2002-04-12', 'Andrews Fox', true, 21, 31, 6);

-- accounts insertion
INSERT INTO accounts (client_id, name, balance, currency, interest_rate, open_date, status, type)
VALUES (2, 'GI22SNNE384692354581375', 800, 'Russian ruble', 3, '2019-05-22', 'Active', 'Regular')
        ,
       (6, 'SA5356517870151625367479', 1000, 'US Dollar', 1, '2021-11-22', 'On validation', 'Deposit')
        ,
       (6, 'PS427713484113599525166228039', 600, 'Euro', 9, '2022-08-12', 'Frozen', 'Charity')
        ,
       (2, 'PS564727044471776388511528166', 250, 'Swiss frank', 8, '2022-10-02', 'Inactive', 'Regular')
        ,
       (21, 'AL28258105384836544542926252', 11, 'Russian ruble', 8, '2020-04-22', 'Active', 'Deposit')
        ,
       (17, 'BA250436047481688749', 20000, 'US Dollar', 7, '2022-05-12', 'On validation', 'Charity')
        ,
       (2, 'KW1178263363575175333562656803', 1545, 'Euro', 7, '2019-09-12', 'Frozen', 'Regular')
        ,
       (4, 'IL447858121669575773855', 94382, 'Swiss frank', 5, '2019-10-22', 'Inactive', 'Deposit')
        ,
       (13, 'GT88793446747612666778806150', 12223, 'Russian ruble', 1, '2020-03-22', 'Active', 'Charity')
        ,
       (20, 'AE685714407086405882756', 1290219, 'US Dollar', 6, '2021-01-22', 'On validation', 'Regular')
        ,
       (13, 'IT038GVRVI15218070836457355', 1232233, 'Euro', 8, '2021-11-02', 'Frozen', 'Deposit')
        ,
       (11, 'PK0576844055623712578817', 211212, 'Swiss frank', 1, '2018-12-22', 'Inactive', 'Charity')
        ,
       (16, 'VG7359884182813450110235', 212122, 'Russian ruble', 6, '2021-04-12', 'Active', 'Regular')
        ,
       (15, 'BA533676646122281996', 5853, 'US Dollar', 4, '2021-05-22', 'On validation', 'Deposit')
        ,
       (3, 'CZ7922793763666888251238', 3838383, 'Euro', 7, '2021-11-02', 'Frozen', 'Charity')
        ,
       (1, 'GL5781352187430106', 3355353, 'Swiss frank', 9, '2022-05-12', 'Inactive', 'Regular')
        ,
       (14, 'DO11810646611762427180230808', 363636363, 'Russian ruble', 3, '2019-01-02', 'Active', 'Deposit')
        ,
       (16, 'GT85664563821485104904282164', 1234567, 'US Dollar', 2, '2022-07-02', 'On validation', 'Charity')
        ,
       (18, 'HR7070438206393638544', 767676, 'Euro', 3, '2020-03-22', 'Frozen', 'Regular')
        ,
       (19, 'FI6592948161068824', 32309, 'Swiss frank', 3, '2019-10-12', 'Inactive', 'Deposit')
        ,
       (20, 'RO47WFPL6166484433614164', 3233233, 'Russian ruble', 2, '2021-03-22', 'Active', 'Charity')
        ,
       (8, 'CH2195241151372363651', 5757557, 'US Dollar', 2, '2021-10-12', 'On validation', 'Regular')
        ,
       (19, 'MR9588852030772939824474760', 3233233, 'Euro', 4, '2022-05-02', 'Frozen', 'Deposit')
        ,
       (2, 'PS151379627297333485334216983', 122122, 'Swiss frank', 3, '2020-08-12', 'Inactive', 'Charity')
        ,
       (5, 'LV78VCGS1748686440462', 46555, 'Russian ruble', 9, '2021-02-12', 'Active', 'Regular')
        ,
       (8, 'IT965PXHCI79441815893380874', 65656, 'US Dollar', 2, '2019-04-22', 'On validation', 'Deposit')
        ,
       (16, 'LB16413408615782340626760212', 6554564, 'Euro', 9, '2018-12-22', 'Frozen', 'Charity')
        ,
       (7, 'KZ057342151911663415', 6546646, 'Swiss frank', 5, '2018-12-22', 'Inactive', 'Regular')
        ,
       (6, 'IE87CDAU36820774488882', 8765, 'Russian ruble', 6, '2021-02-02', 'Active', 'Deposit')
        ,
       (13, 'LT902185523250458137', 464664, 'US Dollar', 2, '2022-01-22', 'On validation', 'Charity')
        ,
       (8, 'GI47FDIF137688766181756', 63563535, 'Euro', 0, '2022-10-02', 'Frozen', 'Regular')
        ,
       (18, 'BH81230291575648019201', 42342445, 'Swiss frank', 4, '2020-05-12', 'Inactive', 'Deposit')
        ,
       (6, 'LV48EQBS1228181127464', 432424, 'Russian ruble', 7, '2021-09-12', 'Active', 'Charity')
        ,
       (11, 'PS028348603394701787494864228', 12345, 'US Dollar', 6, '2021-07-02', 'On validation', 'Regular')
        ,
       (12, 'KW5937283646664021647185207653', 0, 'Euro', 2, '2022-05-12', 'Frozen', 'Deposit')
        ,
       (13, 'LB39745072372213151159443448', 31434, 'Swiss frank', 2, '2022-12-02', 'Inactive', 'Charity')
        ,
       (8, 'AL49377238145576234543961442', 421444, 'Russian ruble', 6, '2021-06-12', 'Active', 'Regular')
        ,
       (7, 'MT54QPUQ57788753131176341870954', 434343443, 'US Dollar', 8, '2020-09-12', 'On validation', 'Deposit')
        ,
       (5, 'AT908116682234815668', 5222525, 'Euro', 7, '2021-12-12', 'Frozen', 'Charity')
        ,
       (3, 'NO8162661340534', 24242442, 'Swiss frank', 7, '2022-10-22', 'Inactive', 'Regular');


-- applications insertion
INSERT INTO applications (client, personal_manager, application_date, type, result, description)
VALUES (9, 2, '2021-11-12', 'Online', 'Confirmed', '')
     , (18, 4, '2021-07-02', 'In office', 'In progress', '')
     , (1, 9, '2020-03-12', 'Online', 'Not started yet', '')
     , (9, 8, '2019-02-22', 'In office', 'Declined', '')
     , (1, 5, '2020-01-22', 'Online', 'Confirmed', '')
     , (18, 9, '2021-02-02', 'In office', 'In progress', '')
     , (7, 5, '2021-07-02', 'Online', 'Not started yet', '')
     , (1, 6, '2022-01-02', 'In office', 'Declined', '')
     , (12, 8, '2022-01-22', 'Online', 'Confirmed', '')
     , (12, 1, '2020-04-22', 'In office', 'In progress', '')
     , (12, 5, '2020-02-12', 'Online', 'Not started yet', '')
     , (10, 5, '2022-05-22', 'In office', 'Declined', '')
     , (4, 6, '2022-11-12', 'Online', 'Confirmed', '')
     , (6, 5, '2020-06-02', 'In office', 'In progress', '')
     , (5, 8, '2021-11-02', 'Online', 'Not started yet', '')
     , (4, 2, '2022-01-12', 'In office', 'Declined', '')
     , (20, 6, '2021-12-12', 'Online', 'Confirmed', '')
     , (17, 6, '2022-09-02', 'In office', 'In progress', '')
     , (2, 7, '2021-12-22', 'Online', 'Not started yet', '')
     , (4, 8, '2019-02-22', 'In office', 'Declined', '')
     , (10, 2, '2022-01-12', 'Online', 'Confirmed', '')
     , (20, 8, '2021-08-02', 'In office', 'In progress', '')
     , (3, 5, '2019-07-02', 'Online', 'Not started yet', '')
     , (14, 8, '2021-09-22', 'In office', 'Declined', '')
     , (14, 4, '2019-07-23', 'Online', 'Confirmed', '')
     , (3, 7, '2019-06-22', 'In office', 'In progress', '')
     , (11, 5, '2019-03-22', 'Online', 'Not started yet', '')
     , (19, 2, '2019-11-12', 'In office', 'Declined', '')
     , (8, 8, '2022-07-12', 'Online', 'Confirmed', '')
     , (16, 8, '2022-08-02', 'In office', 'In progress', '')
     , (3, 8, '2021-09-12', 'Online', 'Not started yet', '')
     , (12, 3, '2020-10-02', 'In office', 'Declined', '')
     , (8, 5, '2020-03-22', 'Online', 'Confirmed', '')
     , (19, 2, '2020-10-02', 'In office', 'In progress', '')
     , (3, 7, '2019-12-02', 'Online', 'Not started yet', '')
     , (2, 6, '2022-06-02', 'In office', 'Declined', '')
     , (1, 1, '2021-01-22', 'Online', 'Confirmed', '')
     , (3, 2, '2021-12-02', 'In office', 'In progress', '')
     , (1, 3, '2020-11-22', 'Online', 'Not started yet', '')
     , (14, 9, '2021-06-12', 'In office', 'Declined', '');


-- transactions insert
INSERT INTO transactions (sender_account, receiver_account, date, amount, type, status, description)
VALUES (23, 13, '2022-11-12', 459, 'Inter-client accounts', 'Confirmed', '')
     , (35, 3, '2021-03-23', 206, 'Inter-clients', 'In progress', '')
     , (36, 28, '2021-08-02', 1092, 'Charity', 'Declined', '')
     , (20, 33, '2022-12-02', 1991, 'Inter-client accounts', 'Confirmed', '')
     , (12, 36, '2022-10-02', 1392, 'Inter-clients', 'In progress', '')
     , (15, 27, '2020-11-22', 902, 'Charity', 'Declined', '')
     , (34, 2, '2022-06-22', 907, 'Inter-client accounts', 'Confirmed', '')
     , (13, 26, '2020-05-02', 643, 'Inter-clients', 'In progress', '')
     , (25, 27, '2022-05-02', 629, 'Charity', 'Declined', '')
     , (3, 33, '2022-03-12', 1915, 'Inter-client accounts', 'Confirmed', '')
     , (7, 17, '2021-10-02', 428, 'Inter-clients', 'In progress', '')
     , (24, 15, '2019-10-02', 738, 'Charity', 'Declined', '')
     , (30, 39, '2019-10-02', 39, 'Inter-client accounts', 'Confirmed', '')
     , (24, 19, '2022-05-02', 129, 'Inter-clients', 'In progress', '')
     , (28, 21, '2019-05-22', 866, 'Charity', 'Declined', '')
     , (7, 3, '2021-05-22', 397, 'Inter-client accounts', 'Confirmed', '')
     , (34, 33, '2021-05-22', 1453, 'Inter-clients', 'In progress', '')
     , (5, 8, '2022-02-12', 926, 'Charity', 'Declined', '')
     , (22, 10, '2019-04-22', 1665, 'Inter-client accounts', 'Confirmed', '')
     , (17, 30, '2021-06-02', 760, 'Inter-clients', 'In progress', '')
     , (33, 28, '2019-02-12', 1703, 'Charity', 'Declined', '')
     , (16, 29, '2019-11-02', 1977, 'Inter-client accounts', 'Confirmed', '')
     , (4, 13, '2020-05-22', 1182, 'Inter-clients', 'In progress', '')
     , (20, 40, '2019-07-22', 1137, 'Charity', 'Declined', '')
     , (16, 11, '2021-08-02', 884, 'Inter-client accounts', 'Confirmed', '')
     , (23, 20, '2022-04-23', 1926, 'Inter-clients', 'In progress', '')
     , (17, 37, '2020-02-02', 1245, 'Charity', 'Declined', '')
     , (33, 27, '2020-09-02', 1653, 'Inter-client accounts', 'Confirmed', '')
     , (4, 14, '2019-04-23', 1283, 'Inter-clients', 'In progress', '')
     , (24, 16, '2022-06-22', 607, 'Charity', 'Declined', '')
     , (22, 19, '2020-09-12', 1415, 'Inter-client accounts', 'Confirmed', '')
     , (28, 27, '2022-01-22', 447, 'Inter-clients', 'In progress', '')
     , (37, 25, '2022-03-22', 115, 'Charity', 'Declined', '')
     , (5, 8, '2020-04-02', 1099, 'Inter-client accounts', 'Confirmed', '')
     , (25, 22, '2020-06-22', 929, 'Inter-clients', 'In progress', '')
     , (37, 19, '2021-10-12', 915, 'Charity', 'Declined', '')
     , (6, 8, '2019-10-22', 263, 'Inter-client accounts', 'Confirmed', '')
     , (23, 22, '2019-08-23', 348, 'Inter-clients', 'In progress', '')
     , (38, 25, '2019-10-02', 1959, 'Charity', 'Declined', '')
     , (20, 23, '2020-06-02', 1265, 'Inter-client accounts', 'Confirmed', '')
     , (34, 23, '2020-12-22', 354, 'Inter-clients', 'In progress', '')
     , (10, 4, '2020-12-02', 244, 'Charity', 'Declined', '')
     , (36, 9, '2020-12-02', 1019, 'Inter-client accounts', 'Confirmed', '')
     , (23, 21, '2020-02-22', 1238, 'Inter-clients', 'In progress', '')
     , (13, 27, '2021-02-22', 1070, 'Charity', 'Declined', '')
     , (8, 13, '2021-06-22', 1642, 'Inter-client accounts', 'Confirmed', '')
     , (25, 35, '2020-12-23', 1204, 'Inter-clients', 'In progress', '')
     , (7, 38, '2019-12-12', 688, 'Charity', 'Declined', '')
     , (10, 10, '2020-05-22', 265, 'Inter-client accounts', 'Confirmed', '')
     , (2, 20, '2020-01-23', 41, 'Inter-clients', 'In progress', '')
     , (13, 20, '2021-06-22', 699, 'Charity', 'Declined', '')
     , (3, 36, '2022-01-12', 1584, 'Inter-client accounts', 'Confirmed', '')
     , (37, 35, '2019-12-12', 1104, 'Inter-clients', 'In progress', '')
     , (20, 4, '2021-12-02', 633, 'Charity', 'Declined', '')
     , (3, 15, '2020-06-02', 411, 'Inter-client accounts', 'Confirmed', '')
     , (28, 28, '2020-01-12', 1807, 'Inter-clients', 'In progress', '')
     , (39, 36, '2020-01-02', 1985, 'Charity', 'Declined', '')
     , (23, 29, '2022-09-02', 418, 'Inter-client accounts', 'Confirmed', '')
     , (35, 20, '2020-02-02', 388, 'Inter-clients', 'In progress', '')
     , (33, 18, '2020-05-12', 615, 'Charity', 'Declined', '')
     , (5, 2, '2022-04-02', 1562, 'Inter-client accounts', 'Confirmed', '')
     , (18, 22, '2022-09-02', 835, 'Inter-clients', 'In progress', '')
     , (19, 28, '2022-07-22', 549, 'Charity', 'Declined', '')
     , (10, 35, '2022-07-02', 1593, 'Inter-client accounts', 'Confirmed', '')
     , (20, 39, '2022-10-23', 977, 'Inter-clients', 'In progress', '')
     , (7, 14, '2020-03-23', 1058, 'Charity', 'Declined', '')
     , (21, 18, '2022-10-22', 941, 'Inter-client accounts', 'Confirmed', '')
     , (23, 1, '2020-04-12', 748, 'Inter-clients', 'In progress', '')
     , (38, 8, '2018-12-22', 1382, 'Charity', 'Declined', '')
     , (29, 5, '2019-08-02', 893, 'Inter-client accounts', 'Confirmed', '')
     , (38, 7, '2019-03-02', 195, 'Inter-clients', 'In progress', '')
     , (15, 27, '2021-11-12', 1709, 'Charity', 'Declined', '')
     , (33, 37, '2021-12-22', 117, 'Inter-client accounts', 'Confirmed', '')
     , (39, 37, '2021-06-22', 1803, 'Inter-clients', 'In progress', '')
     , (3, 36, '2021-12-23', 1078, 'Charity', 'Declined', '')
     , (34, 3, '2022-09-22', 1745, 'Inter-client accounts', 'Confirmed', '')
     , (21, 13, '2022-07-02', 220, 'Inter-clients', 'In progress', '')
     , (26, 33, '2019-07-12', 456, 'Charity', 'Declined', '')
     , (3, 18, '2020-09-12', 10, 'Inter-client accounts', 'Confirmed', '')
     , (23, 16, '2021-06-12', 1652, 'Inter-clients', 'In progress', '')
     , (33, 10, '2021-12-12', 730, 'Charity', 'Declined', '')
     , (3, 7, '2020-03-23', 242, 'Inter-client accounts', 'Confirmed', '')
     , (8, 36, '2019-12-22', 407, 'Inter-clients', 'In progress', '')
     , (36, 39, '2020-07-12', 1096, 'Charity', 'Declined', '')
     , (5, 12, '2021-10-12', 16, 'Inter-client accounts', 'Confirmed', '')
     , (11, 29, '2020-09-12', 1667, 'Inter-clients', 'In progress', '')
     , (30, 19, '2019-02-12', 444, 'Charity', 'Declined', '')
     , (10, 34, '2022-11-12', 1995, 'Inter-client accounts', 'Confirmed', '')
     , (14, 11, '2020-04-12', 1919, 'Inter-clients', 'In progress', '')
     , (11, 23, '2019-11-12', 525, 'Charity', 'Declined', '')
     , (29, 27, '2022-08-22', 1299, 'Inter-client accounts', 'Confirmed', '')
     , (24, 7, '2021-06-02', 1498, 'Inter-clients', 'In progress', '')
     , (13, 28, '2022-10-22', 235, 'Charity', 'Declined', '')
     , (20, 17, '2021-03-12', 147, 'Inter-client accounts', 'Confirmed', '')
     , (37, 14, '2021-07-12', 957, 'Inter-clients', 'In progress', '')
     , (30, 17, '2020-05-02', 442, 'Charity', 'Declined', '')
     , (26, 18, '2021-01-02', 213, 'Inter-client accounts', 'Confirmed', '')
     , (18, 13, '2022-02-22', 1057, 'Inter-clients', 'In progress', '')
     , (4, 39, '2022-07-22', 1242, 'Charity', 'Declined', '')
     , (24, 9, '2019-09-12', 662, 'Inter-client accounts', 'Confirmed', '');
