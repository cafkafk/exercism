def trim: sub("^\\s+"; "") | sub("\\s+$"; "");

def message: sub("^\\[\\w+\\]:"; "")|trim;

def log_level: (. / ":")[0][1:-1]|ascii_downcase;

def reformat: "\(message) (\(log_level))";
