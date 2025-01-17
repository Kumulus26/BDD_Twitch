DROP DATABASE IF EXISTS twitch;
CREATE DATABASE twitch;
USE twitch;

CREATE TABLE MinorCategory(
   id_Minor_Category VARCHAR(50),
   Minor_Category_Name VARCHAR(100) NOT NULL,
   Minor_Category_Description VARCHAR(350),
   Number_Tags INT,
   Tags_Name VARCHAR(30),
   PRIMARY KEY(id_Minor_Category),
   UNIQUE(Minor_Category_Name)
);

CREATE TABLE CharityCampaign(
   id_Charity_Campaign INT AUTO_INCREMENT,
   Charity_Campaign_Name VARCHAR(200),
   Charity_Campaign_Description VARCHAR(2000),
   Streamers_Name VARCHAR(5000),
   Donation_Goal INT,
   PRIMARY KEY(id_Charity_Campaign),
   UNIQUE(Charity_Campaign_Name),
   UNIQUE(Charity_Campaign_Description)
);

CREATE TABLE Category(
   id_Category INT AUTO_INCREMENT,
   Category_Name VARCHAR(50) NOT NULL,
   Category_Description VARCHAR(200),
   id_Minor_Category VARCHAR(50) NOT NULL,
   id_Charity_Campaign INT NOT NULL,
   PRIMARY KEY(id_Category),
   UNIQUE(Category_Name),
   FOREIGN KEY(id_Minor_Category) REFERENCES MinorCategory(id_Minor_Category),
   FOREIGN KEY(id_Charity_Campaign) REFERENCES CharityCampaign(id_Charity_Campaign)
);

CREATE TABLE SubBadges(
   Id_Badge INT AUTO_INCREMENT,
   Badge_Img VARCHAR(100) NOT NULL,
   PRIMARY KEY(Id_Badge)
);

CREATE TABLE ChannelPoints(
   id_Channel_Points INT AUTO_INCREMENT,
   Is_Enable BOOLEAN,
   Number_Channel_Points INT,
   PRIMARY KEY(id_Channel_Points)
);

CREATE TABLE Whisper(
   id_Whisper INT AUTO_INCREMENT,
   Username_Whisper VARCHAR(50) NOT NULL,
   Time_Whisper DATETIME NOT NULL,
   PRIMARY KEY(id_Whisper)
);

CREATE TABLE Vote(
   id_Vote INT AUTO_INCREMENT,
   Option_1 VARCHAR(50),
   Option_2 VARCHAR(50),
   PRIMARY KEY(id_Vote)
);

CREATE TABLE Languages(
   id_Languages INT AUTO_INCREMENT,
   Name_Languages VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_Languages)
);

CREATE TABLE Notifs(
   id_Notifs INT AUTO_INCREMENT,
   Is_Live BOOLEAN NOT NULL,
   Stream_2gether BOOLEAN,
   PRIMARY KEY(id_Notifs)
);

CREATE TABLE Turbo(
   id_Turbo INT AUTO_INCREMENT,
   Is_Active BOOLEAN NOT NULL,
   PRIMARY KEY(id_Turbo)
);

CREATE TABLE TopSubGift(
   id_Top_Subgift VARCHAR(50),
   Name_Top_Subgift VARCHAR(50),
   Amount_Subs_Top_Subgift INT,
   PRIMARY KEY(id_Top_Subgift)
);

CREATE TABLE TopCheers(
   id_top_cheers INT AUTO_INCREMENT,
   Name_Top_Cheers VARCHAR(50),
   Amount_Cheers_Top_Cheers INT,
   PRIMARY KEY(id_top_cheers),
   UNIQUE(Name_Top_Cheers)
);

CREATE TABLE Highlights(
   id_Highlights INT AUTO_INCREMENT,
   Highlights_Name VARCHAR(150),
   Highlights_Description VARCHAR(250),
   Highlights_Lenght TIME,
   PRIMARY KEY(id_Highlights)
);

CREATE TABLE Pubs(
   id_Pubs INT AUTO_INCREMENT,
   Pub_Title VARCHAR(150) NOT NULL,
   Pub_Lenght VARCHAR(50) NOT NULL,
   Pub_Provider VARCHAR(150) NOT NULL,
   Url_Pub VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_Pubs)
);

CREATE TABLE Extensions(
   id_Extension INT AUTO_INCREMENT,
   Name_Extension VARCHAR(50),
   Description_Extensions VARCHAR(300),
   PRIMARY KEY(id_Extension)
);

CREATE TABLE Host(
   id_Host INT AUTO_INCREMENT,
   Is_Firsttime_host BOOLEAN NOT NULL,
   Name_Streamer_Hosted VARCHAR(50) NOT NULL,
   Host_Time TIME NOT NULL,
   PRIMARY KEY(id_Host)
);

CREATE TABLE Stream2gether(
   id_Stream2gether INT AUTO_INCREMENT,
   Name_Streamer VARCHAR(100),
   Is_Firsttime_2gether BOOLEAN,
   Stream_2gether_Lenght TIME,
   PRIMARY KEY(id_Stream2gether)
);

CREATE TABLE CommunityActivity(
   id_CommunityActivity INT AUTO_INCREMENT,
   Is_Enable BOOLEAN,
   PRIMARY KEY(id_CommunityActivity)
);

CREATE TABLE Cookies(
   id_Cookies INT AUTO_INCREMENT,
   Is_Activated BOOLEAN,
   Category_Cookies VARCHAR(100),
   PRIMARY KEY(id_Cookies)
);

CREATE TABLE StreamSummary(
   id_Stream_Summary INT AUTO_INCREMENT,
   Max_Specs INT,
   Average_Specs INT,
   New_Subs INT,
   New_Follow INT,
   Unique_User_On_Chat INT,
   View_Live INT,
   Unique_Specs INT,
   Stream_Length TIME NOT NULL,
   PRIMARY KEY(id_Stream_Summary)
);

CREATE TABLE MonthSummary(
   id_Month_Summary INT AUTO_INCREMENT,
   Chat_participation INT,
   Emotes_used INT,
   Time_watched TIME,
   Next_Sub_Badge TINYINT,
   PRIMARY KEY(id_Month_Summary)
);

CREATE TABLE Drops(
   id INT AUTO_INCREMENT,
   Is_Enabled BOOLEAN NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE StreamReward(
   id VARCHAR(50),
   Is_Enable BOOLEAN,
   PRIMARY KEY(id)
);

CREATE TABLE Partnership(
   id_Partnsership INT AUTO_INCREMENT,
   Partnership_status BOOLEAN,
   Start_date DATE NOT NULL,
   PRIMARY KEY(id_Partnsership)
);

CREATE TABLE Affiliated(
   id_Affiliated INT AUTO_INCREMENT,
   Affiliated_Status BOOLEAN,
   Start_Date DATE NOT NULL,
   PRIMARY KEY(id_Affiliated)
);

CREATE TABLE Moments(
   id_Moments INT AUTO_INCREMENT,
   Moments_Name VARCHAR(150),
   Moments_Description VARCHAR(250),
   Moments_Lenght TIME,
   PRIMARY KEY(id_Moments)
);

CREATE TABLE OverlayStream(
   id_Overlay_Stream INT AUTO_INCREMENT,
   Name_Overlay VARCHAR(100),
   id_Extension INT NOT NULL,
   PRIMARY KEY(id_Overlay_Stream),
   FOREIGN KEY(id_Extension) REFERENCES Extensions(id_Extension)
);

CREATE TABLE Achivements(
   id_Achievements INT AUTO_INCREMENT,
   Name_Achivements VARCHAR(100) NOT NULL,
   Achivements_description VARCHAR(500),
   Date_Achivement DATE,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Achievements)
);

CREATE TABLE Users(
   id_User INT AUTO_INCREMENT,
   Username VARCHAR(50) NOT NULL,
   PasswordMdp VARCHAR(40) NOT NULL,
   Birth_Date DATE NOT NULL,
   Phone_Number DECIMAL(20,0),
   Email VARCHAR(100),
   Newsletter BOOLEAN,
   Bio VARCHAR(300),
   Channel_Is_Live BOOLEAN,
   Profil_Picture_Img VARCHAR(100),
   Profil_Banner_Img VARCHAR(100),
   id_Achievements INT,
   id_Languages INT NOT NULL,
   id_Affiliated INT,
   PRIMARY KEY(id_User),
   UNIQUE(Username),
   FOREIGN KEY(id_Achievements) REFERENCES Achivements(id_Achievements),
   FOREIGN KEY(id_Languages) REFERENCES Languages(id_Languages),
   FOREIGN KEY(id_Affiliated) REFERENCES Affiliated(id_Affiliated)
);

CREATE TABLE Subs(
   id_Subs INT AUTO_INCREMENT,
   Is_Sub BOOLEAN NOT NULL,
   Prime_Sub BOOLEAN NOT NULL,
   Tier_Sub DECIMAL(1,0),
   Start_Date DATE,
   End_Date DATE,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Subs),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Follower(
   id_Follow INT AUTO_INCREMENT,
   Is_Following BOOLEAN,
   Start_Date DATE,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Follow),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Emotes(
   id_Emoji INT AUTO_INCREMENT,
   Emoji_Name VARCHAR(50) NOT NULL,
   Emoji_Img VARCHAR(100) NOT NULL,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Emoji),
   UNIQUE(Emoji_Name),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Story (
   id_Story INT AUTO_INCREMENT,
   Number_Story TINYINT NOT NULL,
   Link_Content VARCHAR(100),
   Lenght_Story TIME,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Story),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE AmazonUser(
   id_AmazonUser INT AUTO_INCREMENT,
   Is_Subscribe_Prime BOOLEAN NOT NULL,
   id_User INT NOT NULL,
   PRIMARY KEY(id_AmazonUser),
   UNIQUE(id_User),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Wallet(
   id_Wallet INT AUTO_INCREMENT,
   Number_Of_Bits INT,
   Card_Info VARCHAR(24),
   id_User INT NOT NULL,
   PRIMARY KEY(id_Wallet),
   UNIQUE(id_User),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Clips(
   id_Clips INT AUTO_INCREMENT,
   Clip_Name VARCHAR(150) NOT NULL,
   Clip_Description VARCHAR(250),
   Clip_Lenght TIME,
   id_Moments INT NOT NULL,
   PRIMARY KEY(id_Clips),
   FOREIGN KEY(id_Moments) REFERENCES Moments(id_Moments)
);

CREATE TABLE Monetisation(
   id_Monetisation INT AUTO_INCREMENT,
   id_User INT,
   Payments_History VARCHAR(300),
   id_Affiliated INT NOT NULL,
   PRIMARY KEY(id_Monetisation),
   UNIQUE(id_Affiliated),
   FOREIGN KEY(id_Affiliated) REFERENCES Affiliated(id_Affiliated)
);

CREATE TABLE Report(
   id_Report VARCHAR(50),
   Report_Name VARCHAR(50) NOT NULL,
   Date_Report DATETIME NOT NULL,
   Reason_Report VARCHAR(50) NOT NULL,
   Report_Description VARCHAR(150) NOT NULL,
   id_User INT NOT NULL,
   PRIMARY KEY(id_Report),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Planning(
   id_Planning INT AUTO_INCREMENT,
   Start_Time DATETIME,
   End_Time DATETIME,
   Category VARCHAR(100),
   Stream_Title VARCHAR(200),
   id_User INT NOT NULL,
   PRIMARY KEY(id_Planning),
   UNIQUE(id_User),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Stream (
   id_stream INT,
   Stream_Title VARCHAR(200) NOT NULL,
   Start_Time TIME,
   End_Time TIME,
   Stream_Description VARCHAR(300),
   Number_Viewer INT,
   Is_18 BOOLEAN,
   id_Category INT NOT NULL,
   id_User INT NOT NULL,
   PRIMARY KEY(id_stream),
   FOREIGN KEY(id_Category) REFERENCES Category(id_Category),
   FOREIGN KEY(id_User) REFERENCES Users(id_User)
);

CREATE TABLE Bits (
   id_Bits INT AUTO_INCREMENT,
   Type_Of_Bits INT NOT NULL,
   Package_Bits INT NOT NULL,
   Price_Bits DECIMAL(3,2),
   id_Wallet INT NOT NULL,
   PRIMARY KEY(id_Bits),
   FOREIGN KEY(id_Wallet) REFERENCES Wallet(id_Wallet)
);

CREATE TABLE Chat(
   id_Chat INT AUTO_INCREMENT,
   Number_Streamer INT NOT NULL,
   Name_Streamer VARCHAR(100) NOT NULL,
   Number_Modo INT,
   Name_Modo VARCHAR(1000),
   Number_Users INT,
   Name_Users VARCHAR(8000),
   id_stream INT NOT NULL,
   PRIMARY KEY(id_Chat),
   UNIQUE(id_stream),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream)
);

CREATE TABLE Predictions(
   id_Predictions INT AUTO_INCREMENT,
   Starttime_prediction DATETIME,
   Endtime_prediction DATETIME,
   Name_Prediction VARCHAR(150) NOT NULL,
   Option_1 VARCHAR(50),
   Option_2 VARCHAR(50),
   Option_3 VARCHAR(50),
   Option_4 VARCHAR(50),
   id_Vote INT,
   id_Chat INT,
   PRIMARY KEY(id_Predictions),
   FOREIGN KEY(id_Vote) REFERENCES Vote(id_Vote),
   FOREIGN KEY(id_Chat) REFERENCES Chat(id_Chat)
);

CREATE TABLE Stats(
   id_Stats INT AUTO_INCREMENT,
   Overview VARCHAR(200),
   Discovery VARCHAR(200),
   id_stream INT NOT NULL,
   PRIMARY KEY(id_Stats),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream)
);

CREATE TABLE Raid(
   id_Raid VARCHAR(50),
   Numbers_Raiders INT,
   id_Host INT,
   id_stream INT,
   id_Stream2gether INT,
   PRIMARY KEY(id_Raid),
   UNIQUE(id_Host),
   FOREIGN KEY(id_Host) REFERENCES Host(id_Host),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Stream2gether) REFERENCES Stream2gether(id_Stream2gether)
);

CREATE TABLE YearlySummary(
   id_Yearly_Summary INT AUTO_INCREMENT,
   Hours_records TIME,
   Days_records TINYINT,
   Best_category VARCHAR(50),
   Favorite_channel VARCHAR(50),
   Send_message INT,
   id_Month_Summary INT,
   id_Stats INT,
   id_Top_Subgift VARCHAR(50),
   id_top_cheers INT,
   PRIMARY KEY(id_Yearly_Summary),
   UNIQUE(id_Month_Summary),
   UNIQUE(Best_category),
   UNIQUE(Favorite_channel),
   FOREIGN KEY(id_Month_Summary) REFERENCES MonthSummary(id_Month_Summary),
   FOREIGN KEY(id_Stats) REFERENCES Stats(id_Stats),
   FOREIGN KEY(id_Top_Subgift) REFERENCES TopSubGift(id_Top_Subgift),
   FOREIGN KEY(id_top_cheers) REFERENCES TopCheers(id_top_cheers)
);

CREATE TABLE Ban(
   id_Ban INT AUTO_INCREMENT,
   Ban_Def BOOLEAN NOT NULL,
   Message_Ban VARCHAR(100),
   Ban_Time INT,
   id_Chat INT,
   PRIMARY KEY(id_Ban),
   FOREIGN KEY(id_Chat) REFERENCES Chat(id_Chat)
);

CREATE TABLE VOD(
   id_Vod INT AUTO_INCREMENT,
   Is_Subscribe_Only BOOLEAN NOT NULL,
   Vod_Name VARCHAR(250) NOT NULL,
   Vod_Lenght TIME,
   Vod_Description VARCHAR(300),
   id_Clips INT NOT NULL,
   id_stream INT NOT NULL,
   id_Highlights INT NOT NULL,
   PRIMARY KEY(id_Vod),
   UNIQUE(id_Clips),
   FOREIGN KEY(id_Clips) REFERENCES Clips(id_Clips),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Highlights) REFERENCES Highlights(id_Highlights)
);

CREATE TABLE Donation(
   id_Donation INT AUTO_INCREMENT,
   Donation_Amount DECIMAL(10,2) NOT NULL,
   Donation_Date DATE NOT NULL,
   id_User VARCHAR(50) NOT NULL,
   id_Stream INT NOT NULL,
   id_stream_1 INT NOT NULL,
   PRIMARY KEY(id_Donation),
   FOREIGN KEY(id_stream_1) REFERENCES Stream(id_stream)
);

CREATE TABLE Receive(
   id_Subs INT,
   Id_Badge INT,
   PRIMARY KEY(id_Subs, Id_Badge),
   FOREIGN KEY(id_Subs) REFERENCES Subs(id_Subs),
   FOREIGN KEY(Id_Badge) REFERENCES SubBadges(Id_Badge)
);

CREATE TABLE To_chat(
   id_User INT,
   id_Chat INT,
   PRIMARY KEY(id_User, id_Chat),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_Chat) REFERENCES Chat(id_Chat)
);

CREATE TABLE Buy(
   id_User INT,
   id_Bits INT,
   id_Turbo INT,
   PRIMARY KEY(id_User, id_Bits, id_Turbo),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_Bits) REFERENCES Bits(id_Bits),
   FOREIGN KEY(id_Turbo) REFERENCES Turbo(id_Turbo)
);

CREATE TABLE To_evoluate(
   id_Partnsership INT,
   id_Affiliated INT,
   PRIMARY KEY(id_Partnsership, id_Affiliated),
   FOREIGN KEY(id_Partnsership) REFERENCES Partnership(id_Partnsership),
   FOREIGN KEY(id_Affiliated) REFERENCES Affiliated(id_Affiliated)
);

CREATE TABLE Relate(
   id_stream INT,
   id_Stream_Summary INT,
   PRIMARY KEY(id_stream, id_Stream_Summary),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Stream_Summary) REFERENCES StreamSummary(id_Stream_Summary)
);

CREATE TABLE Gain(
   id_stream INT,
   id_Channel_Points INT,
   id_CommunityActivity INT,
   id INT,
   id_1 VARCHAR(50),
   PRIMARY KEY(id_stream, id_Channel_Points, id_CommunityActivity, id, id_1),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Channel_Points) REFERENCES ChannelPoints(id_Channel_Points),
   FOREIGN KEY(id_CommunityActivity) REFERENCES CommunityActivity(id_CommunityActivity),
   FOREIGN KEY(id) REFERENCES Drops(id),
   FOREIGN KEY(id_1) REFERENCES StreamReward(id)
);

CREATE TABLE to_choose(
   id_User INT,
   id_Cookies INT,
   PRIMARY KEY(id_User, id_Cookies),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_Cookies) REFERENCES Cookies(id_Cookies)
);

CREATE TABLE Watch (
   id_User INT,
   id_stream INT,
   id_Pubs INT,
   PRIMARY KEY(id_User, id_stream, id_Pubs),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Pubs) REFERENCES Pubs(id_Pubs)
);

CREATE TABLE Send (
   id_stream INT,
   id_Notifs INT,
   PRIMARY KEY(id_stream, id_Notifs),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Notifs) REFERENCES Notifs(id_Notifs)
);

CREATE TABLE To_Send(
   id_User INT,
   id_Whisper INT,
   PRIMARY KEY(id_User, id_Whisper),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_Whisper) REFERENCES Whisper(id_Whisper)
);

CREATE TABLE AddExtension(
   id_stream INT,
   id_Extension INT,
   PRIMARY KEY(id_stream, id_Extension),
   FOREIGN KEY(id_stream) REFERENCES Stream(id_stream),
   FOREIGN KEY(id_Extension) REFERENCES Extensions(id_Extension)
);

CREATE TABLE To_moderate(
   id_User INT,
   id_Ban INT,
   PRIMARY KEY(id_User, id_Ban),
   FOREIGN KEY(id_User) REFERENCES Users(id_User),
   FOREIGN KEY(id_Ban) REFERENCES Ban(id_Ban)
);

INSERT INTO Category (Category_Name, Category_Description, id_Minor_Category, id_Charity_Campaign)
VALUES 
('Action Games', 'Category for action and adventure games', 'MC001', 1),
('Sketching', 'Category for live sketching sessions', 'MC002', 2),
('Rock Music', 'Category for rock music performances', 'MC003', 3),
('Physics', 'Category for physics discussions and experiments', 'MC004', 4),
('Soccer', 'Category for live soccer matches', 'MC005', 5),
('Baking', 'Category for baking tutorials and shows', 'MC006', 6),
('Backpacking', 'Category for backpacking travel tips', 'MC007', 7),
('Podcasting', 'Category for live podcasts', 'MC008', 8),
('Gadget Reviews', 'Category for tech gadget reviews', 'MC009', 9),
('Math Tutorials', 'Category for math tutorials and classes', 'MC010', 10);

INSERT INTO CharityCampaign (Charity_Campaign_Name, Charity_Campaign_Description, Streamers_Name, Donation_Goal)
VALUES 
('Save the Oceans', 'Campaign to clean oceans and reduce pollution', 'Streamer1, Streamer2', 10000),
('Support Homeless', 'Campaign to help the homeless with shelter and food', 'Streamer3, Streamer4', 8000),
('Plant Trees', 'Campaign to plant trees worldwide', 'Streamer5, Streamer6', 5000),
('Health Awareness', 'Campaign for health education and resources', 'Streamer7, Streamer8', 12000),
('Feed the Hungry', 'Campaign for food assistance', 'Streamer9, Streamer10', 9000),
('Animal Rescue', 'Campaign to support animal shelters', 'Streamer11, Streamer12', 7000),
('Disaster Relief', 'Campaign for natural disaster assistance', 'Streamer13, Streamer14', 11000),
('Education for All', 'Campaign for educational resources in low-income areas', 'Streamer15, Streamer16', 10000),
('Mental Health Support', 'Campaign for mental health awareness', 'Streamer17, Streamer18', 13000),
('Child Support', 'Campaign to support children in need', 'Streamer19, Streamer20', 15000);

INSERT INTO Category (Category_Name, Category_Description, id_Minor_Category, id_Charity_Campaign)
VALUES 
('Action Games', 'Category for action and adventure games', 'MC001', 1),
('Sketching', 'Category for live sketching sessions', 'MC002', 2),
('Rock Music', 'Category for rock music performances', 'MC003', 3),
('Physics', 'Category for physics discussions and experiments', 'MC004', 4),
('Soccer', 'Category for live soccer matches', 'MC005', 5),
('Baking', 'Category for baking tutorials and shows', 'MC006', 6),
('Backpacking', 'Category for backpacking travel tips', 'MC007', 7),
('Podcasting', 'Category for live podcasts', 'MC008', 8),
('Gadget Reviews', 'Category for tech gadget reviews', 'MC009', 9),
('Math Tutorials', 'Category for math tutorials and classes', 'MC010', 10);

INSERT INTO SubBadges (Badge_Img)
VALUES 
('badge1.png'),
('badge2.png'),
('badge3.png'),
('badge4.png'),
('badge5.png'),
('badge6.png'),
('badge7.png'),
('badge8.png'),
('badge9.png'),
('badge10.png');

INSERT INTO ChannelPoints (Is_Enable, Number_Channel_Points)
VALUES 
(TRUE, 500),
(TRUE, 1000),
(FALSE, 0),
(TRUE, 750),
(FALSE, 0),
(TRUE, 1250),
(TRUE, 1500),
(FALSE, 0),
(TRUE, 2000),
(TRUE, 2500);

INSERT INTO Whisper (Username_Whisper, Time_Whisper)
VALUES 
('user1', NOW()),
('user2', NOW()),
('user3', NOW()),
('user4', NOW()),
('user5', NOW()),
('user6', NOW()),
('user7', NOW()),
('user8', NOW()),
('user9', NOW()),
('user10', NOW());

INSERT INTO Vote (Option_1, Option_2)
VALUES 
('Yes', 'No'),
('Accept', 'Decline'),
('Like', 'Dislike'),
('Agree', 'Disagree'),
('High', 'Low'),
('Hot', 'Cold'),
('Positive', 'Negative'),
('On', 'Off'),
('Start', 'Stop'),
('Increase', 'Decrease');

INSERT INTO Languages (Name_Languages)
VALUES 
('English'),
('Spanish'),
('French'),
('German'),
('Italian'),
('Chinese'),
('Japanese'),
('Korean'),
('Russian'),
('Portuguese');

INSERT INTO Notifs (Is_Live, Stream_2gether)
VALUES 
(TRUE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE),
(FALSE, FALSE),
(TRUE, TRUE),
(FALSE, FALSE),
(TRUE, TRUE),
(FALSE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE);

INSERT INTO Turbo (Is_Active)
VALUES 
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE);

INSERT INTO TopSubGift (id_Top_Subgift, Name_Top_Subgift, Amount_Subs_Top_Subgift)
VALUES 
('TSG01', 'Gifter1', 50),
('TSG02', 'Gifter2', 45),
('TSG03', 'Gifter3', 40),
('TSG04', 'Gifter4', 55),
('TSG05', 'Gifter5', 60),
('TSG06', 'Gifter6', 65),
('TSG07', 'Gifter7', 35),
('TSG08', 'Gifter8', 30),
('TSG09', 'Gifter9', 25),
('TSG10', 'Gifter10', 20);

INSERT INTO TopCheers (Name_Top_Cheers, Amount_Cheers_Top_Cheers)
VALUES 
('Cheerer1', 5000),
('Cheerer2', 4500),
('Cheerer3', 4000),
('Cheerer4', 3500),
('Cheerer5', 3000),
('Cheerer6', 2500),
('Cheerer7', 2000),
('Cheerer8', 1500),
('Cheerer9', 1000),
('Cheerer10', 500);

INSERT INTO Highlights (Highlights_Name, Highlights_Description, Highlights_Lenght)
VALUES 
('Epic Win', 'An epic victory in-game', '00:03:15'),
('Funny Moment', 'A funny moment during stream', '00:01:45'),
('Amazing Play', 'A highlight of top skill', '00:02:30'),
('Big Fail', 'A funny fail', '00:01:30'),
('Close Call', 'A near miss', '00:02:20'),
('Great Reaction', 'Streamer reaction to a jump scare', '00:01:50'),
('Perfect Timing', 'An impressive timed action', '00:03:00'),
('Unbelievable Luck', 'A lucky streak', '00:02:45'),
('Strategic Move', 'Smart strategic gameplay', '00:04:10'),
('Intense Match', 'An intense in-game match', '00:05:00');

INSERT INTO Pubs (Pub_Title, Pub_Lenght, Pub_Provider, Url_Pub)
VALUES 
('Game Launch', '30s', 'GameCorp', 'http://ad1.com'),
('Tech Gadget', '45s', 'Techies', 'http://ad2.com'),
('Healthy Snacks', '30s', 'SnackFit', 'http://ad3.com'),
('Streaming Gear', '60s', 'StreamEquip', 'http://ad4.com'),
('Clothing Sale', '45s', 'FashionHub', 'http://ad5.com'),
('Movie Trailer', '60s', 'CinemaHouse', 'http://ad6.com'),
('Fitness Gear', '30s', 'GymLife', 'http://ad7.com'),
('Travel Deals', '60s', 'Wanderlust', 'http://ad8.com'),
('Book Release', '45s', 'LitHouse', 'http://ad9.com'),
('Gadget Review', '30s', 'TechReview', 'http://ad10.com');

INSERT INTO Extensions (Name_Extension, Description_Extensions)
VALUES 
('Poll Extension', 'Allows viewers to vote during the stream'),
('Donation Tracker', 'Displays donation goal progress'),
('Chat Highlighter', 'Highlights special chat messages'),
('Game Stats', 'Shows real-time game statistics'),
('Viewer Leaderboard', 'Shows top supporters and viewers'),
('Music Player', 'Integrates a music player into stream'),
('Emote Tracker', 'Tracks emote usage in chat'),
('Fan Wall', 'Displays fan messages on screen'),
('Stream Alerts', 'Custom alerts for various events'),
('Sponsor Banner', 'Displays sponsor ads on screen');

INSERT INTO Host (Is_Firsttime_host, Name_Streamer_Hosted, Host_Time)
VALUES 
(TRUE, 'StreamerA', '02:00:00'),
(FALSE, 'StreamerB', '03:15:00'),
(TRUE, 'StreamerC', '01:30:00'),
(FALSE, 'StreamerD', '04:00:00'),
(TRUE, 'StreamerE', '02:45:00'),
(FALSE, 'StreamerF', '03:20:00'),
(TRUE, 'StreamerG', '02:10:00'),
(FALSE, 'StreamerH', '03:05:00'),
(TRUE, 'StreamerI', '01:50:00'),
(FALSE, 'StreamerJ', '04:30:00');

INSERT INTO Stream2gether (Name_Streamer, Is_Firsttime_2gether, Stream_2gether_Lenght)
VALUES 
('Streamer1', TRUE, '02:30:00'),
('Streamer2', FALSE, '03:45:00'),
('Streamer3', TRUE, '01:20:00'),
('Streamer4', FALSE, '04:10:00'),
('Streamer5', TRUE, '03:00:00'),
('Streamer6', FALSE, '02:40:00'),
('Streamer7', TRUE, '03:25:00'),
('Streamer8', FALSE, '04:05:00'),
('Streamer9', TRUE, '02:15:00'),
('Streamer10', FALSE, '03:50:00');

INSERT INTO CommunityActivity (Is_Enable)
VALUES 
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE);

INSERT INTO Cookies (Is_Activated, Category_Cookies)
VALUES 
(TRUE, 'Performance'),
(TRUE, 'Functional'),
(FALSE, 'Marketing'),
(TRUE, 'Analytics'),
(FALSE, 'Preferences'),
(TRUE, 'Essential'),
(FALSE, 'Security'),
(TRUE, 'Advertising'),
(FALSE, 'Social Media'),
(TRUE, 'Tracking');

INSERT INTO StreamSummary (Max_Specs, Average_Specs, New_Subs, New_Follow, Unique_User_On_Chat, View_Live, Unique_Specs, Stream_Length)
VALUES 
(1500, 1200, 50, 75, 200, 3000, 500, '03:00:00'),
(1400, 1100, 45, 80, 150, 2500, 450, '02:30:00'),
(1300, 1000, 40, 70, 180, 2600, 430, '04:00:00'),
(1600, 1300, 55, 85, 220, 3200, 600, '03:30:00'),
(1700, 1250, 60, 90, 210, 3100, 550, '02:45:00'),
(1800, 1350, 65, 95, 240, 3300, 580, '03:15:00'),
(1900, 1400, 70, 100, 250, 3500, 620, '02:50:00'),
(2000, 1500, 75, 105, 230, 3400, 600, '03:20:00'),
(2100, 1550, 80, 110, 260, 3600, 640, '04:10:00'),
(2200, 1600, 85, 115, 270, 3700, 660, '03:05:00');

INSERT INTO MonthSummary (Chat_participation, Emotes_used, Time_watched, Next_Sub_Badge)
VALUES 
(300, 200, '120:00:00', 1),
(250, 150, '100:00:00', 1),
(275, 175, '110:00:00', 2),
(290, 180, '115:00:00', 2),
(310, 210, '125:00:00', 1),
(325, 230, '130:00:00', 3),
(340, 240, '135:00:00', 1),
(355, 250, '140:00:00', 2),
(370, 260, '145:00:00', 1),
(385, 270, '150:00:00', 2);

INSERT INTO Drops (Is_Enabled)
VALUES 
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE),
(TRUE),
(FALSE);

INSERT INTO StreamReward (id, Is_Enable)
VALUES 
('SR001', TRUE),
('SR002', FALSE),
('SR003', TRUE),
('SR004', FALSE),
('SR005', TRUE),
('SR006', FALSE),
('SR007', TRUE),
('SR008', FALSE),
('SR009', TRUE),
('SR010', FALSE);

INSERT INTO Partnership (Partnership_status, Start_date)
VALUES 
(TRUE, '2022-01-01'),
(FALSE, '2022-02-01'),
(TRUE, '2022-03-01'),
(FALSE, '2022-04-01'),
(TRUE, '2022-05-01'),
(FALSE, '2022-06-01'),
(TRUE, '2022-07-01'),
(FALSE, '2022-08-01'),
(TRUE, '2022-09-01'),
(FALSE, '2022-10-01');

INSERT INTO Affiliated (Affiliated_Status, Start_Date)
VALUES 
(TRUE, '2021-01-01'),
(FALSE, '2021-02-01'),
(TRUE, '2021-03-01'),
(FALSE, '2021-04-01'),
(TRUE, '2021-05-01'),
(FALSE, '2021-06-01'),
(TRUE, '2021-07-01'),
(FALSE, '2021-08-01'),
(TRUE, '2021-09-01'),
(FALSE, '2021-10-01');

INSERT INTO Moments (Moments_Name, Moments_Description, Moments_Lenght)
VALUES 
('Epic Win', 'Amazing win moment', '00:02:30'),
('Funny Fail', 'Funny fail in the game', '00:01:45'),
('Unexpected Move', 'Surprising move made', '00:03:10'),
('Clutch Save', 'Saved at the last second', '00:02:00'),
('Big Reveal', 'Revealed something cool', '00:04:30'),
('Reaction Shock', 'Streamer shock reaction', '00:01:50'),
('Emotional Scene', 'Emotional in-game moment', '00:02:20'),
('Cool Trick', 'Displayed a cool trick', '00:03:05'),
('Perfect Timing', 'Perfectly timed action', '00:02:50'),
('Great Comeback', 'Made an awesome comeback', '00:03:15');

INSERT INTO OverlayStream (Name_Overlay, id_Extension)
VALUES 
('Chat Box Overlay', 1),
('Donation Tracker Overlay', 2),
('Viewer Counter Overlay', 3),
('Game Stats Overlay', 4),
('Follower Alert Overlay', 5),
('Music Player Overlay', 6),
('Leaderboard Overlay', 7),
('Custom Emote Overlay', 8),
('Stream Alert Overlay', 9),
('Sponsor Banner Overlay', 10);

INSERT INTO Achivements (Name_Achivements, Achivements_description, Date_Achivement, id_User)
VALUES 
('100 Followers', 'Reached 100 followers on stream', '2022-01-10', 1),
('500 Views', 'Reached 500 total views', '2022-02-15', 2),
('First Donation', 'Received first donation', '2022-03-20', 3),
('10K Bits Earned', 'Earned 10,000 bits from viewers', '2022-04-18', 4),
('Affiliate Status', 'Became a Twitch Affiliate', '2022-05-22', 5),
('1000 Followers', 'Reached 1,000 followers on stream', '2022-06-25', 6),
('Partner Status', 'Became a Twitch Partner', '2022-07-30', 7),
('100 Streams', 'Completed 100 streaming sessions', '2022-08-05', 8),
('Best New Streamer', 'Awarded Best New Streamer', '2022-09-12', 9),
('Top Content Creator', 'Recognized as a top content creator', '2022-10-16', 10);

INSERT INTO Users (Username, PasswordMdp, Birth_Date, Phone_Number, Email, Newsletter, Bio, Channel_Is_Live, Profil_Picture_Img, Profil_Banner_Img, id_Achievements, id_Languages, id_Affiliated)
VALUES 
('user1', 'pass1', '1990-01-01', 1234567890, 'user1@example.com', TRUE, 'Gamer and streamer', TRUE, 'pic1.jpg', 'banner1.jpg', 1, 1, 1),
('user2', 'pass2', '1992-02-02', 1234567891, 'user2@example.com', FALSE, 'Tech enthusiast', FALSE, 'pic2.jpg', 'banner2.jpg', 2, 2, 2),
('user3', 'pass3', '1994-03-03', 1234567892, 'user3@example.com', TRUE, 'Food and travel lover', TRUE, 'pic3.jpg', 'banner3.jpg', 3, 3, 3),
('user4', 'pass4', '1996-04-04', 1234567893, 'user4@example.com', FALSE, 'Artist and designer', FALSE, 'pic4.jpg', 'banner4.jpg', 4, 4, 4),
('user5', 'pass5', '1998-05-05', 1234567894, 'user5@example.com', TRUE, 'Music streamer', TRUE, 'pic5.jpg', 'banner5.jpg', 5, 5, 5),
('user6', 'pass6', '1990-06-06', 1234567895, 'user6@example.com', FALSE, 'Fitness coach', FALSE, 'pic6.jpg', 'banner6.jpg', 6, 6, 6),
('user7', 'pass7', '1992-07-07', 1234567896, 'user7@example.com', TRUE, 'Gaming strategist', TRUE, 'pic7.jpg', 'banner7.jpg', 7, 7, 7),
('user8', 'pass8', '1994-08-08', 1234567897, 'user8@example.com', FALSE, 'Lifestyle blogger', FALSE, 'pic8.jpg', 'banner8.jpg', 8, 8, 8),
('user9', 'pass9', '1996-09-09', 1234567898, 'user9@example.com', TRUE, 'Education streamer', TRUE, 'pic9.jpg', 'banner9.jpg', 9, 9, 9),
('user10', 'pass10', '1998-10-10', 1234567899, 'user10@example.com', FALSE, 'Gamer and content creator', FALSE, 'pic10.jpg', 'banner10.jpg', 10, 10, 10);

INSERT INTO Subs (Is_Sub, Prime_Sub, Tier_Sub, Start_Date, End_Date, id_User)
VALUES 
(TRUE, TRUE, 1, '2022-01-01', '2022-02-01', 1),
(FALSE, FALSE, 2, '2022-01-02', '2022-02-02', 2),
(TRUE, FALSE, 3, '2022-01-03', '2022-02-03', 3),
(TRUE, TRUE, 1, '2022-01-04', '2022-02-04', 4),
(FALSE, TRUE, 2, '2022-01-05', '2022-02-05', 5),
(TRUE, FALSE, 3, '2022-01-06', '2022-02-06', 6),
(TRUE, TRUE, 1, '2022-01-07', '2022-02-07', 7),
(FALSE, FALSE, 2, '2022-01-08', '2022-02-08', 8),
(TRUE, TRUE, 1, '2022-01-09', '2022-02-09', 9),
(FALSE, TRUE, 2, '2022-01-10', '2022-02-10', 10);

INSERT INTO Follower (Is_Following, Start_Date, id_User)
VALUES 
(TRUE, '2022-01-01', 1),
(FALSE, '2022-01-02', 2),
(TRUE, '2022-01-03', 3),
(FALSE, '2022-01-04', 4),
(TRUE, '2022-01-05', 5),
(FALSE, '2022-01-06', 6),
(TRUE, '2022-01-07', 7),
(FALSE, '2022-01-08', 8),
(TRUE, '2022-01-09', 9),
(FALSE, '2022-01-10', 10);

INSERT INTO Emotes (Emoji_Name, Emoji_Img, id_User)
VALUES 
('Smile', 'smile.png', 1),
('Laugh', 'laugh.png', 2),
('Thumbs Up', 'thumbsup.png', 3),
('Clap', 'clap.png', 4),
('Heart', 'heart.png', 5),
('Fire', 'fire.png', 6),
('Cool', 'cool.png', 7),
('Wow', 'wow.png', 8),
('Sad', 'sad.png', 9),
('Angry', 'angry.png', 10);

INSERT INTO Story (Number_Story, Link_Content, Lenght_Story, id_User)
VALUES 
(1, 'story1.mp4', '00:00:30', 1),
(2, 'story2.mp4', '00:00:45', 2),
(3, 'story3.mp4', '00:00:40', 3),
(4, 'story4.mp4', '00:00:50', 4),
(5, 'story5.mp4', '00:00:35', 5),
(6, 'story6.mp4', '00:00:55', 6),
(7, 'story7.mp4', '00:00:30', 7),
(8, 'story8.mp4', '00:00:45', 8),
(9, 'story9.mp4', '00:00:40', 9),
(10, 'story10.mp4', '00:00:35', 10);

INSERT INTO AmazonUser (Is_Subscribe_Prime, id_User)
VALUES 
(TRUE, 1),
(FALSE, 2),
(TRUE, 3),
(FALSE, 4),
(TRUE, 5),
(FALSE, 6),
(TRUE, 7),
(FALSE, 8),
(TRUE, 9),
(FALSE, 10);

INSERT INTO Wallet (Number_Of_Bits, Card_Info, id_User)
VALUES 
(100, '1234-5678-9101-1121', 1),
(200, '2345-6789-1011-2131', 2),
(300, '3456-7890-1121-3141', 3),
(400, '4567-8901-2131-4151', 4),
(500, '5678-9012-3141-5161', 5),
(600, '6789-0123-4151-6171', 6),
(700, '7890-1234-5161-7181', 7),
(800, '8901-2345-6171-8191', 8),
(900, '9012-3456-7181-9201', 9),
(1000, '0123-4567-8191-0211', 10);

INSERT INTO Clips (Clip_Name, Clip_Description, Clip_Lenght, id_Moments)
VALUES 
('Epic Win Clip', 'Highlight of an epic win', '00:03:00', 1),
('Funny Moment Clip', 'Hilarious moment captured', '00:01:45', 2),
('Skill Showcase Clip', 'Showcasing skill', '00:02:20', 3),
('Close Call Clip', 'Almost lost the game', '00:01:30', 4),
('Big Surprise Clip', 'Streamer surprised', '00:02:50', 5),
('Jump Scare Clip', 'Unexpected scare', '00:01:20', 6),
('Celebration Clip', 'Winning celebration', '00:02:00', 7),
('Unlucky Clip', 'A very unlucky moment', '00:01:15', 8),
('Epic Comeback Clip', 'Made a big comeback', '00:02:30', 9),
('Strategy Win Clip', 'Strategic win', '00:03:45', 10);

INSERT INTO Monetisation (id_User, Payments_History, id_Affiliated)
VALUES 
(1, 'Paid on 2022-01-10, 2022-02-15', 1),
(2, 'Paid on 2022-01-20, 2022-02-25', 2),
(3, 'Paid on 2022-02-10, 2022-03-05', 3),
(4, 'Paid on 2022-03-01, 2022-04-10', 4),
(5, 'Paid on 2022-03-15, 2022-04-25', 5),
(6, 'Paid on 2022-04-05, 2022-05-20', 6),
(7, 'Paid on 2022-05-15, 2022-06-15', 7),
(8, 'Paid on 2022-06-10, 2022-07-05', 8),
(9, 'Paid on 2022-07-01, 2022-08-01', 9),
(10, 'Paid on 2022-08-10, 2022-09-05', 10);

INSERT INTO Report (id_Report, Report_Name, Date_Report, Reason_Report, Report_Description, id_User)
VALUES 
('RPT001', 'Spam', '2022-01-10 15:30:00', 'Spamming in chat', 'User spamming repeated messages', 1),
('RPT002', 'Harassment', '2022-01-12 14:15:00', 'Harassing other users', 'Offensive language used', 2),
('RPT003', 'Inappropriate Content', '2022-01-14 16:20:00', 'Sharing inappropriate content', 'Violation of community guidelines', 3),
('RPT004', 'Spam', '2022-01-16 12:30:00', 'Spamming in chat', 'Repeatedly posting links', 4),
('RPT005', 'Toxicity', '2022-01-18 18:45:00', 'Toxic behavior', 'Creating a hostile environment', 5),
('RPT006', 'Harassment', '2022-01-20 20:15:00', 'Harassing other users', 'Targeted offensive messages', 6),
('RPT007', 'Inappropriate Content', '2022-01-22 10:25:00', 'Sharing inappropriate images', 'Violation of community rules', 7),
('RPT008', 'Spam', '2022-01-24 19:00:00', 'Spamming emojis', 'Flooding chat with emojis', 8),
('RPT009', 'Toxicity', '2022-01-26 14:50:00', 'Using toxic language', 'Insulting other users', 9),
('RPT010', 'Harassment', '2022-01-28 16:40:00', 'Direct harassment', 'Threats made to a user', 10);

INSERT INTO Planning (Start_Time, End_Time, Category, Stream_Title, id_User)
VALUES 
('2022-01-01 14:00:00', '2022-01-01 16:00:00', 'Gaming', 'Epic Fortnite Session', 1),
('2022-01-02 17:00:00', '2022-01-02 19:00:00', 'Music', 'Live DJ Set', 2),
('2022-01-03 18:00:00', '2022-01-03 20:00:00', 'Art', 'Digital Painting Tutorial', 3),
('2022-01-04 15:00:00', '2022-01-04 17:00:00', 'Education', 'Math Tips for High School', 4),
('2022-01-05 13:00:00', '2022-01-05 15:00:00', 'Cooking', 'Baking Cookies', 5),
('2022-01-06 14:00:00', '2022-01-06 16:00:00', 'Travel', 'Tour of Paris', 6),
('2022-01-07 18:00:00', '2022-01-07 20:00:00', 'Science', 'Physics Experiments', 7),
('2022-01-08 12:00:00', '2022-01-08 14:00:00', 'Gaming', 'League of Legends Gameplay', 8),
('2022-01-09 16:00:00', '2022-01-09 18:00:00', 'Talk Shows', 'Interview with a Musician', 9),
('2022-01-10 15:00:00', '2022-01-10 17:00:00', 'Sports', 'Live Soccer Analysis', 10);

INSERT INTO Stream (Stream_Title, Start_Time, End_Time, Stream_Description, Number_Viewer, Is_18, id_Category, id_User)
VALUES 
('Fortnite Fun', '14:00:00', '16:00:00', 'Playing Fortnite with viewers', 500, FALSE, 1, 1),
('DJ Set Live', '17:00:00', '19:00:00', 'Mixing live music', 300, FALSE, 2, 2),
('Art Session', '18:00:00', '20:00:00', 'Digital art creation', 200, FALSE, 3, 3),
('Math Class', '15:00:00', '17:00:00', 'Tips and tricks for math', 150, FALSE, 4, 4),
('Cookie Baking', '13:00:00', '15:00:00', 'Baking cookies live', 250, FALSE, 5, 5),
('Paris Tour', '14:00:00', '16:00:00', 'Exploring Paris', 400, FALSE, 6, 6),
('Physics Fun', '18:00:00', '20:00:00', 'Science experiments', 350, FALSE, 7, 7),
('League Gameplay', '12:00:00', '14:00:00', 'Playing LoL', 600, TRUE, 8, 8),
('Music Interview', '16:00:00', '18:00:00', 'Talking with musicians', 100, FALSE, 9, 9),
('Soccer Analysis', '15:00:00', '17:00:00', 'Discussing soccer matches', 500, FALSE, 10, 10);

INSERT INTO Bits (Type_Of_Bits, Package_Bits, Price_Bits, id_Wallet)
VALUES 
(1, 100, 1.40, 1),
(2, 500, 7.00, 2),
(3, 1000, 13.30, 3),
(4, 1500, 19.95, 4),
(5, 2500, 33.25, 5),
(6, 5000, 66.50, 6),
(7, 7500, 99.75, 7),
(8, 10000, 133.00, 8),
(9, 12500, 166.25, 9),
(10, 15000, 199.50, 10);

INSERT INTO Chat (Number_Streamer, Name_Streamer, Number_Modo, Name_Modo, Number_Users, Name_Users, id_stream)
VALUES 
(1, 'StreamerA', 2, 'Mod1, Mod2', 100, 'User1, User2, User3', 1),
(1, 'StreamerB', 1, 'Mod3', 200, 'User4, User5, User6', 2),
(1, 'StreamerC', 3, 'Mod4, Mod5, Mod6', 150, 'User7, User8, User9', 3),
(1, 'StreamerD', 2, 'Mod7, Mod8', 180, 'User10, User11, User12', 4),
(1, 'StreamerE', 1, 'Mod9', 250, 'User13, User14, User15', 5),
(1, 'StreamerF', 2, 'Mod10, Mod11', 300, 'User16, User17, User18', 6),
(1, 'StreamerG', 1, 'Mod12', 350, 'User19, User20, User21', 7),
(1, 'StreamerH', 3, 'Mod13, Mod14, Mod15', 400, 'User22, User23, User24', 8),
(1, 'StreamerI', 2, 'Mod16, Mod17', 500, 'User25, User26, User27', 9),
(1, 'StreamerJ', 1, 'Mod18', 600, 'User28, User29, User30', 10);

INSERT INTO Predictions (Starttime_prediction, Endtime_prediction, Name_Prediction, Option_1, Option_2, Option_3, Option_4, id_Vote, id_Chat)
VALUES 
('2022-01-01 14:00:00', '2022-01-01 14:05:00', 'Will win?', 'Yes', 'No', NULL, NULL, 1, 1),
('2022-01-02 17:00:00', '2022-01-02 17:10:00', 'High Score?', 'Yes', 'No', NULL, NULL, 2, 2),
('2022-01-03 18:00:00', '2022-01-03 18:10:00', 'Finish quickly?', 'Yes', 'No', NULL, NULL, 3, 3),
('2022-01-04 15:00:00', '2022-01-04 15:10:00', 'Perfect bake?', 'Yes', 'No', NULL, NULL, 4, 4),
('2022-01-05 13:00:00', '2022-01-05 13:10:00', 'Travel smoothly?', 'Yes', 'No', NULL, NULL, 5, 5),
('2022-01-06 14:00:00', '2022-01-06 14:10:00', 'Get all questions?', 'Yes', 'No', NULL, NULL, 6, 6),
('2022-01-07 18:00:00', '2022-01-07 18:10:00', 'Top strategy?', 'Yes', 'No', NULL, NULL, 7, 7),
('2022-01-08 12:00:00', '2022-01-08 12:10:00', 'Best reaction?', 'Yes', 'No', NULL, NULL, 8, 8),
('2022-01-09 16:00:00', '2022-01-09 16:10:00', 'Big win?', 'Yes', 'No', NULL, NULL, 9, 9),
('2022-01-10 15:00:00', '2022-01-10 15:10:00', 'Game Over?', 'Yes', 'No', NULL, NULL, 10, 10);

INSERT INTO Stats (Overview, Discovery, id_stream)
VALUES 
('Good Engagement', 'New followers', 1),
('High Views', 'Great interactions', 2),
('Average Growth', 'Increased engagement', 3),
('High Engagement', 'Good viewership', 4),
('Steady Growth', 'Consistent viewers', 5),
('Top Performer', 'High engagement', 6),
('Great Interaction', 'Many chats', 7),
('Growing Audience', 'Positive responses', 8),
('Top Rank', 'Engaged viewers', 9),
('Massive Reach', 'High engagement', 10);

INSERT INTO Raid (id_Raid, Numbers_Raiders, id_Host, id_stream, id_Stream2gether)
VALUES 
('RD01', 100, 1, 1, 1),
('RD02', 200, 2, 2, 2),
('RD03', 300, 3, 3, 3),
('RD04', 400, 4, 4, 4),
('RD05', 500, 5, 5, 5),
('RD06', 600, 6, 6, 6),
('RD07', 700, 7, 7, 7),
('RD08', 800, 8, 8, 8),
('RD09', 900, 9, 9, 9),
('RD10', 1000, 10, 10, 10);

INSERT INTO YearlySummary (Hours_records, Days_records, Best_category, Favorite_channel, Send_message, id_Month_Summary, id_Stats, id_Top_Subgift, id_top_cheers)
VALUES 
('100:00:00', 365, 'Gaming', 'TopStreamer', 200, 1, 1, 'TSG01', 1),
('90:00:00', 300, 'Music', 'MusicFan', 180, 2, 2, 'TSG02', 2),
('80:00:00', 280, 'Art', 'CreativeArt', 160, 3, 3, 'TSG03', 3),
('85:00:00', 320, 'Sports', 'SportsHub', 150, 4, 4, 'TSG04', 4),
('95:00:00', 340, 'Travel', 'ExploreWorld', 140, 5, 5, 'TSG05', 5),
('70:00:00', 310, 'Cooking', 'CookWithMe', 130, 6, 6, 'TSG06', 6),
('75:00:00', 330, 'Education', 'LearnHub', 120, 7, 7, 'TSG07', 7),
('65:00:00', 290, 'Talk Shows', 'TalkTalk', 110, 8, 8, 'TSG08', 8),
('85:00:00', 350, 'Science', 'ScienceLab', 100, 9, 9, 'TSG09', 9),
('105:00:00', 365, 'Gaming', 'GameZone', 90, 10, 10, 'TSG10', 10);

INSERT INTO Ban (Ban_Def, Message_Ban, Ban_Time, id_Chat)
VALUES 
(TRUE, 'Spamming chat', 10, 1),
(TRUE, 'Offensive language', 15, 2),
(TRUE, 'Inappropriate behavior', 20, 3),
(TRUE, 'Harassment', 25, 4),
(FALSE, 'Minor offense', 5, 5),
(TRUE, 'Flooding messages', 30, 6),
(FALSE, 'Warning issued', 10, 7),
(TRUE, 'Breaking rules', 35, 8),
(TRUE, 'Posting links', 40, 9),
(TRUE, 'Disruptive behavior', 20, 10);

INSERT INTO VOD (Is_Subscribe_Only, Vod_Name, Vod_Lenght, Vod_Description, id_Clips, id_stream, id_Highlights)
VALUES 
(TRUE, 'Fortnite Highlights', '02:00:00', 'Best moments from Fortnite stream', 1, 1, 1),
(FALSE, 'DJ Mix', '01:30:00', 'Full DJ set stream', 2, 2, 2),
(TRUE, 'Art Tutorial', '01:45:00', 'Digital art creation', 3, 3, 3),
(TRUE, 'Math Session', '01:00:00', 'Math tips and solutions', 4, 4, 4),
(FALSE, 'Baking Show', '01:15:00', 'Live cookie baking', 5, 5, 5),
(TRUE, 'City Tour', '02:10:00', 'Exploring Paris', 6, 6, 6),
(FALSE, 'Physics Fun', '01:50:00', 'Science experiments', 7, 7, 7),
(TRUE, 'LoL Gameplay', '01:40:00', 'League of Legends highlights', 8, 8, 8),
(FALSE, 'Music Interview', '01:20:00', 'Chat with musicians', 9, 9, 9),
(TRUE, 'Soccer Recap', '01:30:00', 'Soccer match analysis', 10, 10, 10);

INSERT INTO Donation (Donation_Amount, Donation_Date, id_User, id_Stream, id_stream_1)
VALUES 
(50.00, '2022-01-01', 'user1', 1, 1),
(100.00, '2022-01-02', 'user2', 2, 2),
(75.00, '2022-01-03', 'user3', 3, 3),
(120.00, '2022-01-04', 'user4', 4, 4),
(200.00, '2022-01-05', 'user5', 5, 5),
(150.00, '2022-01-06', 'user6', 6, 6),
(80.00, '2022-01-07', 'user7', 7, 7),
(60.00, '2022-01-08', 'user8', 8, 8),
(90.00, '2022-01-09', 'user9', 9, 9),
(110.00, '2022-01-10', 'user10', 10, 10);