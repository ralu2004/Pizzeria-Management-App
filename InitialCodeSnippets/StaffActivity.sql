SELECT 
r.date, 
s.FirstName,
s.LastName,
s.HourlyRate,
sh.StartTime,
sh.EndTime,
DATEDIFF(HOUR, sh.StartTime, sh.EndTime) AS HoursInShift,
DATEDIFF(HOUR, sh.StartTime, sh.EndTime) * s.HourlyRate AS StaffCost
FROM rota AS r
LEFT JOIN staff AS s ON r.StaffID = s.StaffID
LEFT JOIN shift AS sh ON r.ShiftID = sh.ShiftID
