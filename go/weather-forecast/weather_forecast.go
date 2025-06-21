// Package weather is a weather package.
package weather

// CurrentCondition is a string that strings strings.
var CurrentCondition string

// CurrentLocation is a string that strings strings.
var CurrentLocation string

// Forecast is forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
