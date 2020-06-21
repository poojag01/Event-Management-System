drop table Refreshment;
drop table Event;
drop table Speaker;
drop table Sponsor;
drop table Person;
drop table Dependent;
drop table Audience;
drop table Promoter;
drop table Manager;
drop table Volunteer;
drop table Has;
drop table S_ph_no;
drop table P_ph_no;
drop table Promoted_by;
drop table Joined_by;
drop table Has_dependent;
drop table Sponsored_by;
drop table Managed_by;
drop table Attended_by;


CREATE TABLE Event (
event_id number(10) PRIMARY KEY,
event_name varchar2(40),
event_type varchar2(40),
location varchar2(40),
date DATE,
hour number(2),
min number(2),
days number(2)
);
CREATE TABLE Person(
p_id number(10) PRIMARY KEY,
pname varchar2(40),
paddrline1 varchar2(40),
paddrline2 varchar2(40),
designation varchar2(40)
);

CREATE TABLE P_ph_no(
pid number(10) foreign key references Person(p_id),
pphno number(10),
PRIMARY KEY(pid,pphno)
);
CRAETE TABLE Manager(
mid number(10) foreign key references Person(p_id),
mgrade varchar2(40),
PRIMARY KEY(mid)
);

CREATE TABLE Volunteer(
vid number(10) foreign key references Person(p_id)
);

CREATE TABLE Promoter(
pid number(10) foreign key references Person(p_id) PRIMARY KEY,
ptype varchar2(10),
PRIMARY KEY(pid)
);

create table Refreshment
(	rid number(5) PRIMARY KEY,
	rtype varchar2(10)
);

CREATE TABLE Has(
rid number(5) foreign key references Refreshment,
eid umber(10) foreign key references Event,
PRIMARY KEY(eid,rid)
);

CREATE TABLE Audience (
aid number(5) PRIMARY KEY,
aname varchar(40),
course varchar(40)
);

CREATE TABLE Speaker(
sid number(10) PRIMARY KEY,
sname varchar(40),
spayment number(10)
);
CREATE TABLE S_ph_no(
sid number(10) foreign key references Speaker,
phno number(10),
PRIMARY KEY(sid,phno)
);

CREATE TABLE Sponsor(
spid number(5) PRIMARY KEY,
sname varchar(40),
saddrline1 varchar2(40),
saddrline2 varchar2(20),
amount number(10),
);

CREATE TABLE Sponsored_by(
spid number(10) foreign key references Sponsor,
eid number(10) foreign key references Event,
PRIMARY KEY(spid,eid)
);

CREATE TABLE Managed_by(
mgrid number(10) foreign key references Event,
eid number(10) foreign key references Event,
PRIMARY KEY(mgrid,eid)
);


CREATE TABLE Attended_by(
aid number(5) foreign key references Audience,
eid number(10) foreign key references Event,
PRIMARY KEY(aid,eid)
);

CREATE TABLE Promoted_by(
pid number(10) foreign key references Person,
eid number(10) foreign key references Event,
PRIMARY KEY(pid,eid)
);

CREATE TABLE Joined_by(
sid number(10) foreign key references Speaker,
eid number(10) foreign key references Event,
PRIMARY KEY(sid,eid)
);

CREATE TABLE Dependent(
dname varchar2(20),
dgender varchar2(10)
);

CREATE TAVLE Has_dependent(
dname varchar2(20) foreign key references Dependent,
sid number(10) foreign key references Speaker,
PRIMARY KEY(dname,sid)
);
