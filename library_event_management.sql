-- ============================================================
-- Library Event Management Database
-- Relational Database Project
-- ============================================================

-- ============================================================
-- Complete Database Setup Script
-- ============================================================

CREATE DATABASE IF NOT EXISTS library_event_management;
USE library_event_management;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

-- ============================================================
-- Table: Event
-- ============================================================

CREATE TABLE `Event` (
  `EventID` int(11) NOT NULL,
  `Event_Name` varchar(100) DEFAULT NULL,
  `EventTypeID` int(11) NOT NULL,
  `Event_Date` date DEFAULT NULL,
  `Event_Duration` int(11) DEFAULT NULL CHECK (`Event_Duration` > 0),
  `RoomID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `Ticket_Cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Event`
(`EventID`, `Event_Name`, `EventTypeID`, `Event_Date`, `Event_Duration`, `RoomID`, `StaffID`, `MemberID`, `Ticket_Cost`)
VALUES
(1, 'Author Talk: Historical Fiction', 1, '2026-04-21', 2, 1, 1, 100, 6.00),
(2, 'Children''s Storytime', 2, '2026-04-22', 1, 10, 2, 101, 10.00),
(4, 'Poetry Open Mic Night', 3, '2026-04-24', 3, 4, 4, 103, 2.50),
(5, 'Digital Literacy Workshop', 4, '2026-04-25', 4, 11, 5, 104, 5.00),
(6, 'Teen Manga Club', 5, '2026-04-26', 2, 6, 6, 105, 2.00),
(7, 'Creative Writing Bootcamp', 4, '2026-04-27', 4, 7, 7, 106, 15.00),
(8, 'Book Launch: Voices of the North', 1, '2026-04-28', 2, 1, 8, 107, 4.00),
(9, 'Community Reading Picnic', 6, '2026-04-29', 5, 2, 9, 108, 20.00),
(10, 'Coding for Beginners', 4, '2026-04-30', 4, 13, 10, 109, 6.00),
(11, 'Film Screening: Classic Cinema', 7, '2026-05-01', 3, 12, 11, 110, 10.00),
(12, 'Adult Book Club: Crime Fiction', 5, '2026-05-02', 2, 14, 12, 111, 5.00),
(13, 'Resume & Job Search Help', 8, '2026-05-03', 2, 9, 13, 112, 2.00),
(14, 'Local Author Showcase', 9, '2026-05-04', 2, 3, 14, 113, 3.00),
(15, 'Mindfulness & Meditation Hour', 10, '2026-05-05', 2, 8, 15, 114, 4.00),
(16, 'Library Anniversary Celebration', 6, '2026-05-06', 4, 5, 16, 115, 10.00),
(17, 'Sci-fi Novel Discussion Group', 5, '2026-05-07', 2, 14, 3, 107, 5.00),
(18, 'Environmental Awareness Talk', 11, '2026-05-08', 1, 15, 7, 103, 4.00),
(19, 'Language Exchange Meetup', 6, '2026-05-09', 2, 16, 8, 105, 4.00),
(20, 'Art in the Library Exhibition', 9, '2026-05-10', 3, 3, 10, 111, 8.00);

-- ============================================================
-- Table: EventBooking
-- ============================================================

CREATE TABLE `EventBooking` (
  `BookingID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Booking_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `EventBooking`
(`BookingID`, `MemberID`, `EventID`, `Booking_Date`, `Booking_Status`)
VALUES
(1, 100, 1, '2026-03-18', 'Confirmed'),
(2, 101, 2, '2026-03-19', 'Confirmed'),
(4, 103, 4, '2026-03-21', 'Confirmed'),
(5, 104, 5, '2026-03-22', 'Cancelled'),
(6, 105, 6, '2026-03-23', 'Confirmed'),
(7, 106, 7, '2026-03-24', 'Confirmed'),
(8, 107, 8, '2026-03-25', 'Waitlisted'),
(9, 108, 9, '2026-03-26', 'Confirmed'),
(10, 109, 10, '2026-03-27', 'Confirmed'),
(11, 110, 11, '2026-03-28', 'Confirmed'),
(12, 111, 12, '2026-04-01', 'Waitlisted'),
(13, 112, 13, '2026-04-02', 'Confirmed'),
(14, 113, 14, '2026-04-02', 'Cancelled'),
(15, 114, 15, '2026-04-04', 'Confirmed'),
(16, 115, 16, '2026-04-05', 'Confirmed');

-- ============================================================
-- Table: EventType
-- ============================================================

CREATE TABLE `EventType` (
  `EventTypeID` int(11) NOT NULL,
  `EventTypeDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `EventType`
(`EventTypeID`, `EventTypeDescription`)
VALUES
(1, 'Talk'),
(2, 'Reading Session'),
(3, 'Performance'),
(4, 'Workshop'),
(5, 'Club'),
(6, 'Community Event'),
(7, 'Screening'),
(8, 'Drop-in Session'),
(9, 'Exhibition'),
(10, 'Wellness Session'),
(11, 'Seminar');

-- ============================================================
-- Table: Feedback
-- ============================================================

CREATE TABLE `Feedback` (
  `FeedbackID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Feedback_Date` date DEFAULT NULL,
  `Feedback_Rating` int(11) DEFAULT NULL CHECK (`Feedback_Rating` > 0 AND `Feedback_Rating` < 6),
  `Feedback_Comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Feedback`
(`FeedbackID`, `EventID`, `Feedback_Date`, `Feedback_Rating`, `Feedback_Comments`)
VALUES
(500, 1, '2026-04-21', 5, 'Excellent talk, very informative'),
(501, 2, '2026-04-22', 4, 'Kids really enjoyed it'),
(503, 4, '2026-04-24', 5, 'Outstanding performances'),
(504, 5, '2026-04-25', 4, 'Gained good knowledge about digital literacy'),
(505, 6, '2026-04-26', 3, 'Fun but could be more interactive'),
(506, 7, '2026-04-27', 5, 'Very helpful for developing creativity in writing'),
(507, 8, '2026-04-28', 4, 'Interesting book launch event'),
(508, 9, '2026-04-29', 5, 'Quality time spent with family'),
(509, 10, '2026-04-30', 4, 'Good introduction to coding'),
(510, 11, '2026-05-01', 5, 'Loved the movie screening'),
(511, 12, '2026-05-02', 4, 'Engaging discussion session'),
(512, 13, '2026-05-03', 3, 'Helpful but short session'),
(513, 14, '2026-05-04', 4, 'Nice showcase of local talent'),
(514, 15, '2026-05-05', 5, 'Very relaxing and calming'),
(515, 16, '2026-05-06', 5, 'Well organized celebration'),
(516, 17, '2026-05-07', 4, 'Interesting sci-fi discussion'),
(517, 18, '2026-05-08', 4, 'Informative and relevant topic'),
(518, 19, '2026-05-09', 2, 'Useful but needs diverse language'),
(519, 20, '2026-05-10', 5, 'Beautiful art exhibition');

-- ============================================================
-- Table: Member
-- ============================================================

CREATE TABLE `Member` (
  `MemberID` int(11) NOT NULL,
  `Member_Fname` varchar(50) DEFAULT NULL,
  `Member_Lname` varchar(50) DEFAULT NULL,
  `Member_Email` varchar(50) DEFAULT NULL,
  `Member_Phone` varchar(30) DEFAULT NULL,
  `Member_Type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Fictional/anonymised portfolio data

INSERT INTO `Member`
(`MemberID`, `Member_Fname`, `Member_Lname`, `Member_Email`, `Member_Phone`, `Member_Type`)
VALUES
(100, 'Member', 'One', 'member001@example.com', '0000000001', 'Premium'),
(101, 'Member', 'Two', 'member002@example.com', '0000000002', 'Standard'),
(102, 'Member', 'Three', 'member003@example.com', '0000000003', 'Student'),
(103, 'Member', 'Four', 'member004@example.com', '0000000004', 'Student'),
(104, 'Member', 'Five', 'member005@example.com', '0000000005', 'Student'),
(105, 'Member', 'Six', 'member006@example.com', '0000000006', 'Standard'),
(106, 'Member', 'Seven', 'member007@example.com', '0000000007', 'Student'),
(107, 'Member', 'Eight', 'member008@example.com', '0000000008', 'Student'),
(108, 'Member', 'Nine', 'member009@example.com', '0000000009', 'Premium'),
(109, 'Member', 'Ten', 'member010@example.com', '0000000010', 'Standard'),
(110, 'Member', 'Eleven', 'member011@example.com', '0000000011', 'Student'),
(111, 'Member', 'Twelve', 'member012@example.com', '0000000012', 'Premium'),
(112, 'Member', 'Thirteen', 'member013@example.com', '0000000013', 'Standard'),
(113, 'Member', 'Fourteen', 'member014@example.com', '0000000014', 'Student'),
(114, 'Member', 'Fifteen', 'member015@example.com', '0000000015', 'Premium'),
(115, 'Member', 'Sixteen', 'member016@example.com', '0000000016', 'Standard');

-- ============================================================
-- Table: Room
-- ============================================================

CREATE TABLE `Room` (
  `RoomID` int(11) NOT NULL,
  `Room_Name` varchar(50) DEFAULT NULL,
  `Room_Capacity` int(11) DEFAULT NULL,
  `Hourly_Rate` decimal(10,2) DEFAULT NULL,
  `Facilities` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Room`
(`RoomID`, `Room_Name`, `Room_Capacity`, `Hourly_Rate`, `Facilities`)
VALUES
(1, 'The Main Lecture Hall', 100, 25.00, 'Stage, Speaker, AC, Seating'),
(2, 'Community Garden', 80, 20.00, 'Picnic tables, Play area, Books collection'),
(3, 'Exhibition Hall', 60, 18.00, 'Projector, Display panels, Information desk'),
(4, 'Performance Stage', 30, 15.00, 'Stage, Speaker, Seating'),
(5, 'Celebration Room', 100, 12.00, 'Stage, Mic, Sound system, AC'),
(6, 'Teen Zone', 20, 10.00, 'Seating, Wi-Fi access, Manga book collection'),
(7, 'Creativity Room', 30, 10.00, 'Exhibition panels, AC'),
(8, 'Wellness Training Room', 20, 22.00, 'Yoga mat, AC, Speaker'),
(9, 'Career Support Room', 70, 30.00, 'Staff assistance desk, Computers, Printing facility'),
(10, 'Kids Story Space', 60, 16.00, 'Books, Projector, Seating'),
(11, 'Workshop Room', 40, 16.00, 'Desks, Computer, AC'),
(12, 'Media Room', 140, 18.00, 'Big screen, AC, Sound system, Sofas'),
(13, 'Coding Lab', 30, 22.00, 'Computer, Seating, Projector, Speaker'),
(14, 'Discussion Room', 40, 35.00, 'Cushions, AC, Round Table'),
(15, 'Seminar Room', 75, 14.00, 'Stage, Speaker, AC'),
(16, 'Language Room', 25, 20.00, 'Tables and chairs');

-- ============================================================
-- Table: RoomPayment
-- ============================================================

CREATE TABLE `RoomPayment` (
  `PaymentID` int(11) NOT NULL,
  `EventID` int(11) DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Amount_Paid` decimal(5,2) DEFAULT NULL,
  `Payment_Method` varchar(30) DEFAULT NULL,
  `Payment_Status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `RoomPayment`
(`PaymentID`, `EventID`, `MemberID`, `Payment_Date`, `Amount_Paid`, `Payment_Method`, `Payment_Status`)
VALUES
(200, 1, 100, '2026-03-25', 50.00, 'Cash', 'Paid'),
(201, 2, 101, '2026-03-26', 16.00, 'Cash', 'Paid'),
(203, 4, 103, '2026-03-28', 72.00, 'Cash', 'Paid'),
(204, 5, 104, '2026-03-29', 64.00, 'Cash', 'Failed'),
(205, 6, 105, '2026-03-30', 20.00, 'Online', 'Paid'),
(206, 7, 106, '2026-03-31', 40.00, 'Cash', 'Paid'),
(207, 8, 107, '2026-04-01', 44.00, 'Card', 'Paid'),
(208, 9, 108, '2026-04-02', 75.00, 'Online', 'Paid'),
(209, 10, 109, '2026-04-03', 88.00, 'Cash', 'Paid'),
(210, 11, 110, '2026-04-04', 54.00, 'Card', 'Paid'),
(211, 12, 111, '2026-04-05', 40.00, 'Online', 'Paid'),
(212, 13, 112, '2026-04-06', 60.00, 'Cash', 'Paid'),
(213, 14, 113, '2026-04-07', 36.00, 'Card', 'Failed'),
(214, 15, 114, '2026-04-08', 44.00, 'Online', 'Paid'),
(215, 16, 115, '2026-04-09', 48.00, 'Cash', 'Paid'),
(216, 17, 107, '2026-04-10', 70.00, 'Card', 'Paid'),
(217, 18, 103, '2026-04-11', 14.00, 'Online', 'Paid'),
(218, 19, 105, '2026-04-12', 60.00, 'Cash', 'Pending'),
(219, 20, 111, '2026-04-13', 60.00, 'Card', 'Paid');

-- ============================================================
-- Table: Staff
-- ============================================================

CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL,
  `Staff_Name` varchar(100) DEFAULT NULL,
  `Staff_Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Fictional/anonymised portfolio data

INSERT INTO `Staff`
(`StaffID`, `Staff_Name`, `Staff_Email`)
VALUES
(1, 'Staff Member 01', 'staff001@example.com'),
(2, 'Staff Member 02', 'staff002@example.com'),
(3, 'Staff Member 03', 'staff003@example.com'),
(4, 'Staff Member 04', 'staff004@example.com'),
(5, 'Staff Member 05', 'staff005@example.com'),
(6, 'Staff Member 06', 'staff006@example.com'),
(7, 'Staff Member 07', 'staff007@example.com'),
(8, 'Staff Member 08', 'staff008@example.com'),
(9, 'Staff Member 09', 'staff009@example.com'),
(10, 'Staff Member 10', 'staff010@example.com'),
(11, 'Staff Member 11', 'staff011@example.com'),
(12, 'Staff Member 12', 'staff012@example.com'),
(13, 'Staff Member 13', 'staff013@example.com'),
(14, 'Staff Member 14', 'staff014@example.com'),
(15, 'Staff Member 15', 'staff015@example.com'),
(16, 'Staff Member 16', 'staff016@example.com');

-- ============================================================
-- Primary Keys and Indexes
-- ============================================================

ALTER TABLE `Event`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `EventTypeID` (`EventTypeID`),
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `MemberID` (`MemberID`);

ALTER TABLE `EventBooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `EventID` (`EventID`);

ALTER TABLE `EventType`
  ADD PRIMARY KEY (`EventTypeID`);

ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `EventID` (`EventID`);

ALTER TABLE `Member`
  ADD PRIMARY KEY (`MemberID`);

ALTER TABLE `Room`
  ADD PRIMARY KEY (`RoomID`);

ALTER TABLE `RoomPayment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `EventID` (`EventID`);

ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`);

-- ============================================================
-- AUTO_INCREMENT
-- ============================================================

ALTER TABLE `EventType`
  MODIFY `EventTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `Feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

ALTER TABLE `Member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

ALTER TABLE `RoomPayment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

-- ============================================================
-- Foreign Key Constraints
-- ============================================================

ALTER TABLE `Event`
  ADD CONSTRAINT `Event_ibfk_1`
    FOREIGN KEY (`EventTypeID`) REFERENCES `EventType` (`EventTypeID`)
    ON DELETE CASCADE,
  ADD CONSTRAINT `Event_ibfk_2`
    FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`)
    ON DELETE CASCADE,
  ADD CONSTRAINT `Event_ibfk_3`
    FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`)
    ON DELETE CASCADE,
  ADD CONSTRAINT `Event_ibfk_4`
    FOREIGN KEY (`MemberID`) REFERENCES `Member` (`MemberID`)
    ON DELETE CASCADE;

ALTER TABLE `EventBooking`
  ADD CONSTRAINT `EventBooking_ibfk_1`
    FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`);

ALTER TABLE `Feedback`
  ADD CONSTRAINT `Feedback_ibfk_1`
    FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`);

ALTER TABLE `RoomPayment`
  ADD CONSTRAINT `RoomPayment_ibfk_2`
    FOREIGN KEY (`MemberID`) REFERENCES `Member` (`MemberID`),
  ADD CONSTRAINT `RoomPayment_ibfk_3`
    FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`);

COMMIT;
