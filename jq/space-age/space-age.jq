def two_decimal: ((. * 100) | round) / 100;

def ratios:
  {
    Mercury: 0.2408467,
    Venus:   0.61519726,
    Earth:   1.0,
    Mars:    1.8808158,
    Jupiter: 11.862615,
    Saturn:  29.447498,
    Uranus:  84.016846,
    Neptune: 164.79132
  }[.] // ("not a planet"|halt_error);

# seconds per day: 86400 (60*60*24)
.seconds/86400/(.planet|ratios*365.25)|two_decimal
