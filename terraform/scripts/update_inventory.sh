awk -v ip="$1" '
  BEGIN { in_frame = 0 }
  /^\[frame\][[:space:]]*$/ { in_frame = 1; print; next }
  /^\[/ && $0 !~ /^\[frame\]/ { in_frame = 0; print; next }
  {
    if (in_frame && $0 ~ /^[[:space:]]*changeme([[:space:]]|$)/) sub(/^[[:space:]]*changeme/, ip)
    print
  }
' "$2" > "$2.tmp" && mv "$2.tmp" "$2"