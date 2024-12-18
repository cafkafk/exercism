if .property == "grade" then (
    .input.desiredGrade as $target
    | .input.students
    | unique_by(.[0])
    | map(select(.[1]==$target))
    | map(.[0])
    | sort
  )
elif .property == "roster" then (
    .input.students
    | unique_by(.[0])
    | map({name: .[0], grade: .[1]})
    | sort_by(.name)
    | sort_by(.grade)
    | map(.name)
  )
end
