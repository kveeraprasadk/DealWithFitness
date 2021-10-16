create table dwfadmin(
	dwfid		int	NOT NULL auto_increment,
	username	varchar(50)	NOT NULL	UNIQUE,		
	password	varchar(100)	NOT NULL,
	PRIMARY KEY(dwfid,username)
)

create table traineeregister(
	traineeid	int	NOT NULL auto_increment,
	traineename	varchar(50),			
	dob			varchar(50),			
	target		varchar(50),		
	ailment		varchar(50),
	state		varchar(50),
	city		varchar(50),			
	phone		varchar(50),			
	username	varchar(50)	NOT NULL UNIQUE,		
	password	varchar(100)	NOT NULL,			
	createtime	timestamp,	
	PRIMARY KEY (traineeid,username)
);

create table trainerregister(
	trainerid				int	NOT NULL auto_increment,
	trainername				varchar(50)	NOT NULL,			
	traineremail			varchar(50)	NOT	NULL,		
	experience				varchar(50)	NOT	NULL,		
	qualification			varchar(50)	NOT	NULL,	
	phoneno					varchar(50),
	expertise				varchar(50),			
	classlevel				varchar(50),
	schedules				varchar(50),			
	monthlyfees				varchar(50),			
	expertise2				varchar(50),		
	classlevel2				varchar(50),			
	schedules2				varchar(50),			
	monthlyfees2			varchar(50),			
	expertise3				varchar(50),			
	classlevel3				varchar(50),			
	schedules3				varchar(50),		
	monthlyfees3			varchar(50),			
	class1demo				varchar(30),			
	class2demo				varchar(30),			
	class3demo				varchar(30),			
	aboutyourself			varchar(1000)	NOT NULL,
	photoname				varchar(100)	NOT NULL,			
	photo					mediumblob,		
	creationtime			timestamp,			
	certificate1			mediumblob,			
	certificate1filename	varchar(50),			
	certificate2			mediumblob,	
	certificate2filename	varchar(50),			
	certificate3			mediumblob,	
	certificate3filename	varchar(50),			
	password				varchar(100),
	adminapprove			varchar(50),
	PRIMARY KEY (trainerid)
);

create table trainertemptable(
	trainerid				int	NOT NULL auto_increment,
	trainername				varchar(50)	NOT NULL,			
	traineremail			varchar(50)	NOT	NULL,		
	experience				varchar(50)	NOT	NULL,		
	qualification			varchar(50)	NOT	NULL,		
	expertise				varchar(50),			
	classlevel				varchar(50),
	schedules				varchar(50),			
	monthlyfees				varchar(50),			
	expertise2				varchar(50),		
	classlevel2				varchar(50),			
	schedules2				varchar(50),			
	monthlyfees2			varchar(50),			
	expertise3				varchar(50),			
	classlevel3				varchar(50),			
	schedules3				varchar(50),		
	monthlyfees3			varchar(50),			
	class1demo				varchar(30),			
	class2demo				varchar(30),			
	class3demo				varchar(30),			
	aboutyourself			varchar(1000)	NOT NULL,
	photoname				varchar(100)	NOT NULL,			
	photo					mediumblob,		
	creationtime			timestamp,			
	certificate1			mediumblob,			
	certificate1filename	varchar(50),			
	certificate2			mediumblob,	
	certificate2filename	varchar(50),			
	certificate3			mediumblob,	
	certificate3filename	varchar(50),			
	password				varchar(100),
	adminapprove			varchar(50),
	PRIMARY KEY (trainerid)
);

create table trainerrejectlist(
	tid						int	NOT NULL auto_increment,
	trainername				varchar(50)	NOT NULL,			
	traineremail			varchar(50)	NOT	NULL,		
	experience				varchar(50)	NOT	NULL,		
	qualification			varchar(50)	NOT	NULL,		
	expertise				varchar(50),			
	classlevel				varchar(50),
	schedules				varchar(50),			
	monthlyfees				varchar(50),						
	aboutyourself			varchar(1000)	NOT NULL,
	photoname				varchar(100)	NOT NULL,			
	photo					mediumblob,		
	creationtime			timestamp,			
	certificate1			mediumblob,			
	certificate1filename	varchar(50),			
	certificate2			mediumblob,	
	certificate2filename	varchar(50),			
	certificate3			mediumblob,	
	certificate3filename	varchar(50),			
	password				varchar(100),
	adminapprove			varchar(50),
	PRIMARY KEY (tid)
);

create table schedulesSeries (
	id 					varchar(50) NOT NULL,	
	traineremail 		varchar(50) NOT NULL,
	title 				varchar(100),
	location			varchar(512),
	startTime			long,
	endTime				long,
	endByDate			long,
	selectedDayNames	varchar(512),
	trainerPreference	varchar(20),
	expertise			varchar(40),
	demoClass			boolean default false,
	fee					float,
	classLevel			varchar(20),
	expertise			varchar(40),	
	demoClass			tinyint(1),
	PRIMARY KEY (traineremail, id)
);

create table schedules (
	id 				varchar(50) NOT NULL,
	trainerId 		varchar(100) NOT NULL,
	seriesId	 	varchar(50) NOT NULL,
	title 			varchar(100),
	location		varchar(512),
	start			long,
	end				long,
	PRIMARY KEY (trainerId, id)
);

create table traineeBookings (
	trainerId varchar(50) NOT NULL,	
	traineeId varchar(50) NOT NULL,
	seriesId varchar(50) NOT NULL,
	PRIMARY KEY (trainerId, traineeId, seriesId)
);

create table fitnessComments (
	commentid	int	NOT NULL auto_increment,
	commentorname	varchar(100),	
	commentoremail	varchar(100),			
	subject	varchar(500),		
	comment	varchar(2000),			
	commenttime	timestamp,
	PRIMARY KEY (commentid)
);