package cars

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	res := successRate * float64(productionRate) / 100
	return res
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(successRate*float64(productionRate)) / 60 / 100
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	// Batches of 10 cars can be produced more efficiently
	// Unit: Dollars
	var batch uint = uint(carsCount/10) * 95000
	// The remaining cars have a regular price
	// Unit: Dollars
	var remainder uint = uint(carsCount%10) * 10000
	return remainder + batch
}
