BEGIN {
  shard_max_size = 1024 * 1024 * 5; # ~5Mb
  shard_size = 0;
  shard_nr = 0;
} 
{
  line_size = length($0);
  #line_size = 1000;
  shard_size += line_size;
  # First line, store header.
  if (NR == 1) {
    header=$0;
    mkdir(shard_nr);
  }
  if  (shard_size >= shard_max_size) {
    shard_nr++;
    shard_size = line_size;
    mkdir(shard_nr);
    to_file(header, shard_nr);
  }
  to_file($0, shard_nr);
}

function mkdir(shard) {
  system("mkdir -p split/" shard);
}
function to_file(text, shard) {
  print text > "split/" shard "/" FILENAME
}
