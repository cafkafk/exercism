package lasagna

func PreparationTime(layers []string, avgPrep int) int {
	if avgPrep == 0 {
		avgPrep = 2
	}
	return len(layers) * avgPrep
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for i, layersLen := 0, len(layers); i < layersLen; i++ {
		if layers[i] == "sauce" {
			sauce = float64(layersLen) * 0.2
		} else if layers[i] == "noodles" {

			noodles = layersLen * 50
		}
	}
	return
}

func AddSecretIngredient(friendIngredients []string, myIngredients []string) {
	myIngredients[len(myIngredients)-1] = friendIngredients[len(friendIngredients)-1]
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64 {
	// We make an explicit copy of quantities, to avoid changing the original,
	// since go uses pass by reference for slices and maps.
	amounts := make([]float64, len(quantities))
	copy(quantities, amounts)

	for i := 0; i < len(amounts); i++ {
		amounts[0] = (amounts[0] / 2) * float64(portions)
	}
	return amounts
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
