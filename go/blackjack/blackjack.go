package blackjack

/*
| card  | value | card    | value |
| :---: | :---: | :-----: | :---: |
|  ace  |  11   | eight   |   8   |
|  two  |   2   | nine    |   9   |
| three |   3   |  ten    |  10   |
| four  |   4   | jack    |  10   |
| five  |   5   | queen   |  10   |
|  six  |   6   | king    |  10   |
| seven |   7   | *other* |   0   |

**Note**: Commonly, aces can take the value of 1 or 11 but for simplicity we will assume that they can only take the value of 11.

Depending on your two cards and the card of the dealer, there is a strategy for the first turn of the game, in which you have the following options:

- Stand (S)
- Hit (H)
- Split (P)
- Automatically win (W)

Although not optimal yet, you will follow the strategy your friend Alex has been developing, which is as follows:

- If you have a pair of aces you must always split them.
- If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a face card (Jack/Queen/King) or a ten then you automatically win. If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
- If your cards sum up to a value within the range [17, 20] you should always stand.
- If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
- If your cards sum up to 11 or lower you should always hit.
*/

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ace":
		return 11
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten", "jack", "queen", "king":
		return 10
	default:
		return 0
	}
}

/*
- If you have a pair of aces you must always split them.

- If you have a Blackjack (two cards that sum up to a value of 21), and the
  dealer does not have an ace, a face card (Jack/Queen/King) or a ten then you
  automatically win. If the dealer does have any of those cards then you'll have
  to stand and wait for the reveal of the other card.

- If your cards sum up to a value within the range [17, 20] you should always stand.

- If your cards sum up to a value within the range [12, 16] you should always
  stand unless the dealer has a 7 or higher, in which case you should always
  hit.

- If your cards sum up to 11 or lower you should always hit.
*/

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	playerScore := ParseCard(card1) + ParseCard(card2)
	dealerScore := ParseCard(dealerCard)

	switch {
	case card1 == "ace" && card2 == "ace":
		return "P"
	case playerScore == 21:
		if dealerScore < 10 {
			return "W"
		}
		return "S"
	case playerScore >= 17 && playerScore <= 20:
		return "S"
	case playerScore >= 12 && playerScore <= 16:
		if dealerScore >= 7 {
			return "H"
		}
		return "S"
	case playerScore <= 11:
		return "H"
	default:
		return "S" // Should not be reached with valid inputs, but as a fallback.
	}
}
