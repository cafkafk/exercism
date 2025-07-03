package booking

import (
	"fmt"
	"time"
)

const layout = "1/2/2006 15:04:05"

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	parsedTime, err := time.Parse(layout, date)
	if err != nil {
		fmt.Println("Error parsing time:", err)
	}
	return parsedTime
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	panic("Please implement the HasPassed function")
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	panic("Please implement the IsAfternoonAppointment function")
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	panic("Please implement the Description function")
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	panic("Please implement the AnniversaryDate function")
}
