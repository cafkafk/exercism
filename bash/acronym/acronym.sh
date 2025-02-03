#!/usr/bin/env bash

# Solutions below have been imrpoved when relavant in various ways the authors
# didn't originally write.

# bdejean's solution, explained
bdejean() {
  echo "$1" | \
    # Removes '
    tr -d "'" | \
    # Adds line breaks between each word
    tr -c '[:lower:][:upper:]' '\n' | \
    # Gets first character of each line of input
    cut -c1 | \
    # Translates lowercase letters to uppercase
    tr '[:lower:]' '[:upper:]' | \
    # Removes newlines
    tr -d '\n'
}

# delamoe's solution
delamoe() {
  # Parameter expands $1 to uppercase
  STR="${1^^}"
  # Parameter expands all hyphens with spaces
  STR="${STR//-/ }"
  # Parameter expands with string substitution. Removes any character from STR that is not an uppercase
  # letter (A-Z) or a space.
  #
  # The ^ inside the square brackets [^...] negates the character set, meaning
  # "anything but the following characters".
  STR="${STR//[^A-Z\ ]/}"
  # This is particularly hacky, it makes us of globbing and word splitting.
  # shellcheck disable=SC2086  # Intentional globbing
  printf "%c" $STR
}

# stevebosman's solution
stevebosman() {
  # Sets Internal Field Separator, the variable that defines how bash does
  # word splitting.
  #
  # This makes the for-loop split words on -, space, _, and *.
  local IFS='- _*'
  local acronym=""
  for word in $1; do
    # Uses parameter expansion to get first letter of word.
    local letter="${word:0:1}"
    # Appends capitalized first letter of word to acronyms.
    local acronym+=${letter^^}
  done
  echo "$acronym"
}

# seancowens13's solution
seancowens13() {
  acronym=""
  # Replaces any character that is not a lowercase letter (a-z), an uppercase
  # letter (A-Z), or an apostrophe (') with a space. This effectively removes
  # punctuation and other non-alphanumeric characters (except apostrophes) from
  # the sentence.
  sentence=${1//[^a-zA-Z\']/ }
  # Uppercases sentence
  sentence="${sentence^^}"
  for word in $sentence
  do
    acronym+="${word:0:1}"
  done
  echo "$acronym"
}

bdejean "$@"
