interest({var p,var i,var y})
{
  var si=p*i*y/100;
  print("simple interest is $si");
  var i1=i+si;
  print("you have to pay $i1");
}
void main()
{
  interest(p:7,i:5000,y:3);
}
/*intrest({var pri,var roi,var year})
{
  var intrest1 = pri*roi*year/100;
  var ans = pri+intrest1;
  print(ans);
}

void main()
{
  intrest(roi:7,pri:5000,year: 3);

}*/