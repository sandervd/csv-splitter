NR==1 {
  header=$0; 
  count=1;
  mkdir(count);
  to_file(header, count);
  next 
} 

!( (NR-1) % 100000) {
  count++; 
  mkdir(count);
  to_file(header, count);
} 
{
  to_file($0, count)
}

function mkdir(count) {
  system("mkdir -p split/" count)
}
function to_file(text, count)
{
     print text > "split/" count "/" FILENAME
}
