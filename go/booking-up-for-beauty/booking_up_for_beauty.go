package booking

import (
	"fmt"
	"time"
)

const date_layout = "1/2/2006 15:04:05"
const time_layout = "January 2, 2006 15:04:05"

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	parsedTime, err := time.Parse(date_layout, date)
	if err != nil {
		fmt.Println("Error parsing time:", err)
	}
	return parsedTime
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	parsedTime, err := time.Parse(time_layout, date)
	if err != nil {
		fmt.Println("Error parsing time:", err)
	}
	return time.Now().After(parsedTime)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
//
// Implement the `IsAfternoonAppointment` function that takes an appointment
// date and checks if the appointment is in the afternoon (>= 12:00 and <
// 18:00):
func IsAfternoonAppointment(date string) bool {
	layout := "Monday, January 2, 2006 15:04:05"
	parsedTime, err := time.Parse(layout, date)
	if err != nil {
		fmt.Println("Error parsing time:", err)
	}
	return parsedTime.Hour() >= 12 && parsedTime.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	parsedTime, err := time.Parse(date_layout, date)
	if err != nil {
		fmt.Println("Error parsing time:", err)
	}
	return fmt.Sprintf("You have an appointment on %s.", parsedTime.Format("Monday, January 2, 2006, at 15:04"))
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
