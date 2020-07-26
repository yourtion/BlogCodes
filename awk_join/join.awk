function read_file_into_array(file, array, status, record) {
  while (1) {
    status = getline record < file
    if (status == -1) {
      print "Failed to read file " file;
      exit 1;
    }
    if (status == 0) break;
    split(record, a, "\t");
    array[a[1]] = a[2];
  }
  close(file);
}
BEGIN {
  read_file_into_array(CHANNEL, File);
} 
{ 
  if(NR == 1) {
    print "channel\tid\tpv\tuv\tsubmit"
    next
  }
  { printf("%s\t%s\t%s\t%s\t%s\t\n", ($1 in File ? File[$1] : "未知"),$1,$2,$3,$4) }
}