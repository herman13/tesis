match($0,/fig:(\w|-)*/,all) {
  print "\\ref{" all[0] "}"
}

match($0,/tbl:(\w|-)*/,all) {
  print "\\ref{" all[0] "}"
}
