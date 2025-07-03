package interest

const (
	negativeBalanceInterestRate float32 = 3.213
	smallBalanceInterestRate    float32 = 0.5
	mediumBalanceInterestRate   float32 = 1.621
	largeBalanceInterestRate    float32 = 2.475
)

const (
	smallBalanceThreshold  = 1000
	mediumBalanceThreshold = 5000
)

const percent = 100

// InterestRate returns the interest rate for the provided balance.
func InterestRate(balance float64) float32 {
	switch {
	case balance < 0:
		return negativeBalanceInterestRate
	case balance < smallBalanceThreshold:
		return smallBalanceInterestRate
	case balance < mediumBalanceThreshold:
		return mediumBalanceInterestRate
	default:
		return largeBalanceInterestRate
	}
}

// Interest calculates the interest for the provided balance.
func Interest(balance float64) float64 {
	return balance * float64(InterestRate(balance)) / percent
}

// AnnualBalanceUpdate calculates the annual balance update, taking into account the interest rate.
func AnnualBalanceUpdate(balance float64) float64 {
	return balance + Interest(balance)
}

// YearsBeforeDesiredBalance calculates the minimum number of years required to reach the desired balance.
func YearsBeforeDesiredBalance(balance, targetBalance float64) int {
	years := 0
	for balance < targetBalance {
		balance = AnnualBalanceUpdate(balance)
		years++
	}
	return years
}