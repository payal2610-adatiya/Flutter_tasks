import 'dart:io';

void main()
{
  try{
    var fout=File("E:\\a.txt");
    //var fout=File("D:\\a.txt");
    fout.writeAsString("hello");
  }
  catch(e)
  {
    print(e);
  }
  finally{
    print("hello");
  }
}