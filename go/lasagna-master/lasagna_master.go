package lasagna

func PreparationTime(layers []string, avgPrep int) int {
	if avgPrep == 0 {
		avgPrep = 2
	}
	return len(layers) * avgPrep
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		switch layer {
		case "noodles":
			noodles += 50
		case "sauce":
			sauce += 0.2
		}
	}
	return
}

func AddSecretIngredient(friendIngredients []string, myIngredients []string) {
	myIngredients[len(myIngredients)-1] = friendIngredients[len(friendIngredients)-1]
}

const portionsInOriginalRecipe = 2

func ScaleRecipe(quantities []float64, portions int) []float64 {
	scaledQuantities := make([]float64, len(quantities))
	scalingFactor := float64(portions) / portionsInOriginalRecipe

	for i, quantity := range quantities {
		scaledQuantities[i] = quantity * scalingFactor
	}
	return scaledQuantities
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
