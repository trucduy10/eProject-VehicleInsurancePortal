Create database VIP_DB
Go
use VIP_DB
go
create table [Customer] (
	ID int primary key identity(1,1),
	CustomerEmail varchar(50) unique not null,
	[Password] varchar(50) not null,
	CustomerName varchar(50) not null,
	CustomerAddress varchar(100) not null,
	CustomerPhone bigint not null
);
go
create table [Admin] (
	AdminId int primary key identity(1,1),
	UserName varchar(50) unique not null,
	[Password] varchar(50) not null
);
go
create table [Vehicle] (
	ID int primary key identity(1,1),
	VehicleName varchar(50) not null,
	VehicleOwnerName varchar(50) not null,
	VehicleModel varchar(50) not null,
	VehicleVersion varchar(50) not null,
	VehicleRate money not null CHECK(VehicleRate >= 0),
	VehicleBodyNumber varchar(50) not null,
	VehicleEngineNumber varchar(50) not null,
	VehicleNumber int unique not null CHECK(VehicleNumber > 0)
);
go

create table [Policy] (
	ID int primary key identity(1,1),
	PolicyType varchar(50) not null,
	[Description] varchar(500) not null,
	-- Coverage: Dynamic content - display All coverage of each policy
	Coverage varchar(8000) not null,
	Annually money not null CHECK(Annually >= 0)
); 
go


create table [Estimate] (
	ID int primary key identity(1,1),
	EstimateNo int unique not null,
	VehicleName varchar(50) not null,
	VehicleModel varchar(50) not null,
	VehicleVersion varchar(50) not null,
	PolicyID int not null CHECK(PolicyID > 0),
	--OptionDetailsID int default 1,
	EstimateDate date not null CHECK(DATEDIFF(day, GetDate(), EstimateDate) <=0 ),
	PolicyDate date not null,
	PolicyDuration int default 12 not null CHECK(PolicyDuration > 0),
	Premium money not null CHECK(Premium >= 0),
	CONSTRAINT FK_Estimate_Policy FOREIGN KEY (PolicyID) REFERENCES [Policy](ID),
	--CONSTRAINT FK_Estimate_OptionDetails FOREIGN KEY (OptionDetailsID) REFERENCES [OptionDetails](ID)
); 
go

create table [Certificate] (
	ID int primary key identity(1,1),
	PolicyNo int unique not null,
	EstimateNo int not null,
	CustomerID int not null,
	VehicleNumber int not null,
	VehicleBodyNumber varchar(50) not null,
	VehicleEngineNumber varchar(50) not null,
	VehicleWarranty varchar(50) default 'Not Available' 
		Check (VehicleWarranty IN ('Not Available','Available','Pending')),
	Prove varchar(200) not null,
	CONSTRAINT FK_Estimate_Certificate FOREIGN KEY (EstimateNo) REFERENCES [Estimate](EstimateNo),
	CONSTRAINT FK_Customer_Certificate FOREIGN KEY (CustomerID) REFERENCES Customer(ID)
); 
go

create table [CustomerBill] (
	ID int primary key identity(1,1),
	BillNo int unique not null,
	PolicyNo int not null,
	[Status] varchar(50) default 'Pending' Check([Status] IN ('Pending', 'Completed')),
	[Date] date default cast(getdate() as date),
	Amount money CHECK(Amount >= 0),
	CONSTRAINT FK_Certificate_Bill FOREIGN KEY (PolicyNo) REFERENCES [Certificate](PolicyNo)
); 
go

create table [Company_Expense] (
	ID int primary key identity(1,1),
	DateOfExpense date not null,
	TypeOfExpense varchar(50) not null,
	AmountOfExpense money not null CHECK(AmountOfExpense > 0)
); 
go

create table [Claim] (
	ID int primary key identity(1,1),
	ClaimNo int not null,
	PolicyNo int not null,
	PlaceOfAccident varchar(100) not null,
	DateOfAccident date not null,
	[Description] varchar(500) not null,
	[Status] varchar(20) default 'Lodged' CHECK ([Status] in ('Lodged', 'Inspecting', 'Approved', 'Insufficient','Rejected')),
	[Image] varchar(1000),
	InsuredAmount money not null CHECK(InsuredAmount > 0),
	ClaimableAmount money CHECK(ClaimableAmount >= 0),
	CONSTRAINT FK_Claim_Certificate FOREIGN KEY (PolicyNo) REFERENCES [Certificate](PolicyNo)
); 
go

INSERT INTO Customer Values
('angelasmith@gmail.com', 'angela@smith', 'Angela Smith', '3782 Victoria Court Monroe, ME, 04951', 841231234567),
('toan@gmail.com', 'abc@123', 'Nguyen Toan', 'PTH', 84908230668),
('ngannnk@gmail.com', 'abc@123', 'Nguyen Ngoc Kim Ngan', 'LHP', 84903320689)
go
INSERT INTO [Admin] Values
('admin','admin')
go

INSERT INTO Vehicle Values
('Honda', 'Owner', 'Accord', 'VTi-L', 29000.0000, 'VB5566778891MZ', 'EG-178899-INE', 1111),
('Honda', 'Owner', 'Accord', 'V6-L', 25000.0000, 'VB5566778872MZ', 'EG-278866-INE', 1112),
('Honda', 'Owner', 'City', 'VTi-L', 21000.0000, 'VB5566778893MZ', 'EG-378899-INE', 1113),
('Honda', 'Owner', 'City', 'VTi-LM (LE)', 20000.0000, 'VB5566778874MZ', 'EG-478866-INE', 1114),
('Honda', 'Owner', 'City', 'VTi-L GM', 21000.0000, 'VB5566778895MZ', 'EG-578899-INE', 1115),
('Honda', 'Owner', 'Civic', 'VTi-X', 22000.0000, 'VB5566778876MZ', 'EG-678866-INE', 1116),
('Honda', 'Owner', 'Civic', 'VTi-S', 21000.0000, 'VB5566778897MZ', 'EG-888899-INE', 1117),
('Honda', 'Owner', 'Civic', 'RS', 19800.0000, 'VB5566778878MZ', 'EG-878866-INE', 1118),
('Honda', 'Owner', 'CR-V', 'VTi-S (4x4)', 28000.0000, 'VB5566778889MZ', 'EG-978899-INE', 1119),
('Honda', 'Owner', 'CR-V', 'VTi-L7 (2WD)', 28900.0000, 'VB5566778879MZ', 'EG-108866-INE', 1200),
('Honda', 'Owner', 'CR-V', 'LE (4x2)', 21000.0000, 'VB5566778810MZ', 'EG-118899-INE', 1201),
('Honda', 'Owner', 'CR-V', 'VTi-LM', 20000.0000, 'VB5566778811MZ', 'EG-128866-INE', 1202),

('BMW', 'Owner', 'M5', 'LAUNCH EDITION F90', 21000.0000, 'VB5566778899MZ', 'EG-851648-INE', 1203),
('BMW', 'Owner', 'M5', 'F10', 52700.0000, 'VB5566778877MZ', 'EG-976235-INE', 1204),
('BMW', 'Owner', 'M5', 'LAUNCH EDITION F90', 119000.0000, 'VB5566778899MZ', 'EG-784321-INE', 1205),
('BMW', 'Owner', 'M5', 'NIGHTHAWK F10', 92000.0000, 'VB5566778823MZ', 'EG-432829-INE', 1206),
('BMW', 'Owner', 'M5', 'LAUNCH EDITION F90', 21000.0000, 'VB5766778832MZ', 'EG-956111-INE', 1207),
('BMW', 'Owner', 'M5', 'SHADOW F10', 59000.0000, 'VB5566678811MZ', 'EG-348479-INE', 1208),
('BMW', 'Owner', 'M2', 'F87', 54000.0000, 'VB5566778811MZ', 'EG-721158-INE', 1209),
('BMW', 'Owner', 'M2', 'COMPETITION F87', 55000.0000, 'VB5566738811MZ', 'EG-858253-INE', 1210),
('BMW', 'Owner', 'M2', 'PURE F87', 57000.0000, 'VB5566778582MZ', 'EG-299592-INE', 1211),
('BMW', 'Owner', 'M3', 'COMPETITION F80', 59000.0000, 'VB5566778815MZ', 'EG-705082-INE', 1212),
('BMW', 'Owner', 'M3', 'PURE F80', 52000.0000, 'VB5566778816MZ', 'EG-823939-INE', 1213),
('BMW', 'Owner', 'M3', 'F80 LCI', 53000.0000, 'VB5566778817MZ', 'EG-363459-INE', 1214),
('BMW', 'Owner', 'M3', 'CS F80', 54000.0000, 'VB5566778818MZ', 'EG-338527-INE', 1215),

('FORD', 'Owner', 'EVEREST', 'AMBIENTE', 21000.0000, 'VB5566778831MZ', 'EG-947631-INE', 1216),
('FORD', 'Owner', 'EVEREST', 'TREND', 22000.0000, 'VB5566778834MZ', 'EG-420082-INE', 1217),
('FORD', 'Owner', 'EVEREST', 'TITANIUM', 24000.0000, 'VB5566778835MZ', 'EG-711742-INE', 1218),
('FORD', 'Owner', 'ESCAPE', 'AMBIENTE', 21000.0000, 'VB5566778838MZ', 'EG-576981-INE', 1219),
('FORD', 'Owner', 'ESCAPE', 'TREND', 23000.0000, 'VB5566788831MZ', 'EG-486378-INE', 1220),
('FORD', 'Owner', 'ESCAPE', 'TITANIUM', 24000.0000, 'VB5566778833MZ', 'EG-581584-INE', 1221),
('FORD', 'Owner', 'ESCAPE', 'ST-LINE', 22000.0000, 'VB5566778836MZ', 'EG-465787-INE', 1222),
('FORD', 'Owner', 'MONDEO', 'AMBIENTE', 27000.0000, 'VB5566778837MZ', 'EG-592958-INE', 1223),
('FORD', 'Owner', 'MONDEO', 'TREND', 29000.0000, 'VB556677883MZ', 'EG-701632-INE', 1224),
('FORD', 'Owner', 'MONDEO', 'TITANIUM', 24000.0000, 'VB5566778827MZ', 'EG-768673-INE', 1225),
('FORD', 'Owner', 'FOCUS', 'TREND', 25000.0000, 'VB5566778828MZ', 'EG-946218-INE', 1226),
('FORD', 'Owner', 'FOCUS', 'TITANIUM', 24000.0000, 'VB5566778829MZ', 'EG-913587-INE', 1227),
('FORD', 'Owner', 'FOCUS', 'ST-LINE', 28000.0000, 'VB5566778830MZ', 'EG-129542-INE', 1228),
('FORD', 'Owner', 'FOCUS', 'ACTIVE', 29000.0000, 'VB5566778832MZ', 'EG-777269-INE', 1229),
('FORD', 'Owner', 'ECOSPORT', 'AMBIENTE', 25000.0000, 'VB5566778840MZ', 'EG-449789-INE', 1230),
('FORD', 'Owner', 'ECOSPORT', 'TREND', 21000.0000, 'VB5566778841MZ', 'EG-806389-INE', 1231),
('FORD', 'Owner', 'ECOSPORT', 'TITANIUM', 24000.0000, 'VB5566778842MZ', 'EG-591382-INE', 1232),

('HYUNDAI', 'Owner', 'ELANTRA', 'ACTIVE', 22000.0000, 'VB5566778842MZ', 'EG-409541-INE', 1233),
('HYUNDAI', 'Owner', 'ELANTRA', 'SPORT', 24000.0000, 'VB5566778843MZ', 'EG-569328-INE', 1234),
('HYUNDAI', 'Owner', 'ELANTRA', 'ELITE', 25000.0000, 'VB5566778844MZ', 'EG-800577-INE', 1235),
('HYUNDAI', 'Owner', 'ELANTRA', 'TROPHY', 28000.0000, 'VB5566778845MZ', 'EG-532454-INE', 1236),
('HYUNDAI', 'Owner', 'ELANTRA', 'SR TURBO', 24000.0000, 'VB5566778846MZ', 'EG-591382-INE', 1237),
('HYUNDAI', 'Owner', 'TUCSON', 'ACTIVE', 28000.0000, 'VB5566778847MZ', 'EG-997587-INE', 1238),
('HYUNDAI', 'Owner', 'TUCSON', 'ELITE', 29000.0000, 'VB5566778848MZ', 'EG-117228-INE', 1239),
('HYUNDAI', 'Owner', 'TUCSON', 'HIGHLANDER', 25000.0000, 'VB5566778849MZ', 'EG-699656-INE', 1240),
('HYUNDAI', 'Owner', 'TUCSON', 'SPECIAL EDITION', 24000.0000, 'VB5566778850MZ', 'EG-153608-INE', 1241),
('HYUNDAI', 'Owner', 'TUCSON', 'GO', 22000.0000, 'VB5566778851MZ', 'EG-409448-INE', 1242),
('HYUNDAI', 'Owner', 'i30', 'ACTIVE', 23000.0000, 'VB5566778852MZ', 'EG-499889-INE', 1243),
('HYUNDAI', 'Owner', 'i30', 'GO', 24000.0000, 'VB5566778853MZ', 'EG-922983-INE', 1244),
('HYUNDAI', 'Owner', 'i30', 'SR', 22000.0000, 'VB5566778854MZ', 'EG-248367-INE', 1245),
('HYUNDAI', 'Owner', 'i30', 'ELITE', 27000.0000, 'VB5566778855MZ', 'EG-221467-INE', 1246),
('HYUNDAI', 'Owner', 'i30', 'PREMIUM', 26000.0000, 'VB5566778856MZ', 'EG-528438-INE', 1247),
('HYUNDAI', 'Owner', 'IONIQ', 'HYBRID', 24000.0000, 'VB5566778857MZ', 'EG-781698-INE', 1248),
('HYUNDAI', 'Owner', 'IONIQ', 'PLUG-IN', 26000.0000, 'VB5566778858MZ', 'EG-803739-INE', 1249),
('HYUNDAI', 'Owner', 'IONIQ', 'ELECTRIC', 22000.0000, 'VB5566778859MZ', 'EG-644765-INE', 1250),
('HYUNDAI', 'Owner', 'KONA', 'ACTIVE', 22000.0000, 'VB5566778860MZ', 'EG-106960-INE', 1251),
('HYUNDAI', 'Owner', 'KONA', 'LAUNCH', 23000.0000, 'VB5566778861MZ', 'EG-594129-INE', 1252),
('HYUNDAI', 'Owner', 'KONA', 'ELITE', 25000.0000, 'VB5566778862MZ', 'EG-370196-INE', 1253),
('HYUNDAI', 'Owner', 'KONA', 'HIGHLANDER', 27000.0000, 'VB5566778863MZ', 'EG-812370-INE', 1254),

('SUBARU', 'Owner', 'FORESTER', '2.5-L', 32000.0000, 'VB5566778864MZ', 'EG-812370-INE', 1255),
('SUBARU', 'Owner', 'FORESTER', '2.0i-L', 31000.0000, 'VB5566778865MZ', 'EG-661963-INE', 1256),
('SUBARU', 'Owner', 'FORESTER', '2.0XT', 27000.0000, 'VB5566778866MZ', 'EG-924467-INE', 1257),
('SUBARU', 'Owner', 'FORESTER', 'FLEET EDITION', 32000.0000, 'VB5566778867MZ', 'EG-633107-INE', 1258),
('SUBARU', 'Owner', 'LEVORG', '1.6 GT', 30000.0000, 'VB5566778868MZ', 'EG-437907-INE', 1259),
('SUBARU', 'Owner', 'LEVORG', '2.0 GT-S', 29000.0000, 'VB5566778869MZ', 'EG-156891-INE', 1260),
('SUBARU', 'Owner', 'LEVORG', '1.6 GT PREMIUM', 26000.0000, 'VB5566778870MZ', 'EG-576705-INE', 1261),
('SUBARU', 'Owner', 'LEVORG', '2.0 STi SPORT', 27000.0000, 'VB5566778871MZ', 'EG-439126-INE', 1262),
('SUBARU', 'Owner', 'OUTBACK', '2.0D', 27000.0000, 'VB5566778872MZ', 'EG-386393-INE', 1263),
('SUBARU', 'Owner', 'OUTBACK', '2.5i', 28000.0000, 'VB5566778873MZ', 'EG-571973-INE', 1264),
('SUBARU', 'Owner', 'OUTBACK', '3.6R', 32000.0000, 'VB5566778874MZ', 'EG-663612-INE', 1265),
('SUBARU', 'Owner', 'OUTBACK', '2.5i-X', 31000.0000, 'VB5566778875MZ', 'EG-636916-INE', 1266),
('SUBARU', 'Owner', 'XV', '2.0i', 25000.0000, 'VB5566778876MZ', 'EG-498656-INE', 1267),
('SUBARU', 'Owner', 'XV', '2.0i-L', 27000.0000, 'VB5566778877MZ', 'EG-495893-INE', 12568),
('SUBARU', 'Owner', 'XV', '2.0i-S', 31000.0000, 'VB5566778878MZ', 'EG-365515-INE', 1269),
('SUBARU', 'Owner', 'XV', '2.0i PREMIUM', 28000.0000, 'VB5566778879MZ', 'EG-947871-INE', 1270),

('TOYOTA', 'Owner', 'CAMRY', 'SL V6', 27000.0000, 'VB5566778880MZ', 'EG-895327-INE', 1271),
('TOYOTA', 'Owner', 'CAMRY', 'SX V6', 28000.0000, 'VB5566778881MZ', 'EG-380344-INE', 1272),
('TOYOTA', 'Owner', 'CAMRY', 'ASCENT SPORT', 25000.0000, 'VB5566778882MZ', 'EG-436710-INE', 1273),
('TOYOTA', 'Owner', 'CAMRY', 'ASCENT HYBRID', 29000.0000, 'VB5566778883MZ', 'EG-173963-INE', 1274),
('TOYOTA', 'Owner', 'FORTUNER', 'GX GUN', 27000.0000, 'VB5566778884MZ', 'EG-959111-INE', 1275),
('TOYOTA', 'Owner', 'FORTUNER', 'GXL GUN', 29000.0000, 'VB5566778885MZ', 'EG-349487-INE', 1276),
('TOYOTA', 'Owner', 'FORTUNER', 'CRUSADE GUN', 28000.0000, 'VB5566778886MZ', 'EG-896965-INE', 1277),
('TOYOTA', 'Owner', 'LANDCRUISER', 'PRADO GX', 24000.0000, 'VB5566778887MZ', 'EG-457905-INE', 1278),
('TOYOTA', 'Owner', 'LANDCRUISER', 'LC200 ALTITUDE', 25000.0000, 'VB5566778888MZ', 'EG-239705-INE', 1279),
('TOYOTA', 'Owner', 'LANDCRUISER', 'SAHARA', 27000.0000, 'VB5566778889MZ', 'EG-597422-INE', 1280),
('TOYOTA', 'Owner', 'LANDCRUISER', 'WORKMATE', 29000.0000, 'VB5566778890MZ', 'EG-155035-INE', 1281),
('TOYOTA', 'Owner', 'TARAGO', 'GLI', 33000.0000, 'VB5566778891MZ', 'EG-155035-INE', 1282),
('TOYOTA', 'Owner', 'TARAGO', 'GLI V6', 30000.0000, 'VB5566778892MZ', 'EG-822182-INE', 12883),
('TOYOTA', 'Owner', 'TARAGO', 'GLX', 29000.0000, 'VB5566778893MZ', 'EG-665172-INE', 1284),
('TOYOTA', 'Owner', 'TARAGO', 'GLX V6', 27000.0000, 'VB5566778894MZ', 'EG-137840-INE', 1285),
('TOYOTA', 'Owner', 'TARAGO', 'ULTIMA V6', 32000.0000, 'VB5566778895MZ', 'EG-612844-INE', 1286)
go


INSERT INTO [Policy] Values
('Third Party Fire and Theft',
'Get great value cover with RaCE Third Party Fire and Theft Insurance. You�ll be covered for unintentional damage you cause to other people�s property. And you can rest at ease knowing you�re also covered for up to $10,000 if your car is stolen or damaged by a fire.',
'With an RaCE Third Party Property Fire and Theft Insurance policy, you�ll be covered for a range of events. Here�s a summary of what�s included:
Liability cover up to $20 million for unintentional damage to someone else�s vehicle or property.
Up to $10,000 in cover for loss or damage to your vehicle caused by fire, theft or attempted theft.
Hire car after a theft or attempted theft where your vehicle can�t be driven, for up to 21 days.
Up to $5000 in limited cover for damage to your vehicle if you�re not at fault in the collision, the other driver is uninsured and you can provide their details.
One tow from an incident to a safe place or repairer.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.',
500),

('Third-Party Property Damage',
'Third Party Property Damage insurance is the most affordable, basic cover offered by RaCE for unintentional damage you cause to another person�s vehicle or property, such as colliding with another car or hitting someone�s fence.',
'With an RaCE Third Party Property Damage car insurance policy, you�ll be covered for a range of events. Here�s a summary of what�s included:
Liability cover up to $20 million for unintentional damage to someone else�s vehicle or property.
Up to $5000 in limited cover for damage to your vehicle if you�re not at fault in the collision, the other driver is uninsured and you can provide their details.
One tow from an incident to a safe place or repairer.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.',
490),

('Comprehensive', 
'Comprehensive car insurance protects you from potentially hefty bills when an accident occurs. No matter who�s at fault, you and anyone permitted to drive your vehicle1 , will be covered for collision damage to your vehicle and other people�s property.
Go with the standard inclusions, or add optional extras to suit your needs and budget � like hire car cover, windscreen cover with no excess or pick your own licensed repairer.*',
'Loss or damage to your vehicle caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.
Hire car after a not-at-fault collision if your car is unsafe to drive or is in for repairs. The at-fault driver�s details must be provided.
Liability cover up to $20 million for damage to someone else�s vehicle or property.
Up to $500 for personal items if they�re stolen with your vehicle or damaged in an incident. Some exclusions apply.
New replacement vehicle where available if your vehicle is up to 2 years old and RaCE Insurance considers it to be a total loss and agrees to pay your claim.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.'
,2000),

('Complete Care�', 
'Complete Care� Car Insurance covers all the things you�d expect from comprehensive cover, plus extra inclusions like emergency accommodation, pet assistance, and no excess for windscreen, sunroof and window glass repairs. Drive with confidence when you choose the highest level of RaCE Motor Insurance available.',
'With an RaCE Complete Care� Car Insurance policy, you�ll be covered for a range of events. Here�s a summary of what�s included:
Loss or damage to your vehicle caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.
Hire car after an incident or theft until your vehicle is repaired and returned to you.
Pet assistance in the event you�re involved in an incident more that 100km from home and need to stay in pet-friendly accommodation.
Cover for windscreen, sunroof and window glass damage as a result of an incident, without any excess payment.
Vehicle towing, pickup and return if you�re involved in an incident.
Liability cover up to $20 million for unintentional collision damage to someone else�s vehicle or property.
New replacement vehicle if RaCE Insurance considers your vehicle to be a total loss and agrees to pay your claim. Conditions apply.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.'
,2800)
go

INSERT INTO [Estimate] Values
(561004852, 'Honda', 'Civic', 'VTi-S', 3, '2022-12-31', '2023-01-02', 12, 2305),
(100565553, 'HYUNDAI', 'TUCSON', 'ACTIVE', 2, '2023-01-02', '2023-01-02', 12, 490),
(489854101, 'SUBARU', 'LEVORG', '1.6 GT', 4, '2023-01-02', '2023-01-06', 12, 2800)
go

INSERT INTO [Certificate] Values
(975756100, 561004852, 1, 123456, '2HGFC2F52GH501186', 'D16A1204695', 'Available', '20230101/1415eee6525e4884a80b5f05f0e8ee26&bodyNo_hondaCivic.jpeg&enginNo_hondaCivic.jpg&honda_civic.jpg&vehicleNo.jpg'),
(481009750, 100565553, 1, 171219, 'KMHD35LE7DU088519', 'C02A060NAL', 'Pending', '20230102/839c2b7ad48d4f2cba5bc3ead5a71b72&Hyundai-Tucson-Reg-Details.png&tucson.jpg&tucson_body.jpg&tucson_engine.jpeg'),
(102525152, 489854101, 1, 1234566, 'GC8066030GC8E2DD', 'EJ20KDW7PR', 'Not Available', '20230102/1146338cdacb4270ab56373f2c51baa9&subaru_body_engin.jpg&subaru_levorg.png&subary.jpg')
go

INSERT INTO [CustomerBill] Values
(505556535, 481009750, 'Completed', '2023-01-02', 490),
(984951569, 975756100, 'Completed', '2023-01-02', 2305)
go

INSERT INTO [Claim] Values
(564951554, 975756100, 'Hue', '2023-01-01', 'I suddenly get hit by another car', 'Approved', 'Honda-Civicdamagedjpg.jpg', 2000, 2000),
(981005110, 975756100, 'Nha Trang', '2023-01-02', 'Somebody hit my car', 'Lodged', 'Honda-Civicdamagedjpg.jpg', 1000, 0),
(575399565, 975756100, 'Hanoi', '2022-12-30', 'That''s so lucky for me BUT my car', 'Inspecting', 'Honda-Civicdamagedjpg.jpg', 2500, 0)