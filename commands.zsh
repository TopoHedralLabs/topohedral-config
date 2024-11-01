
alias get_version='grep -E "^version = " Cargo.toml | awk -F\" "{print \$2}"'