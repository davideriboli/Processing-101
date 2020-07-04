int f0 = 0;
int f1 = 1;
int f2 = 1;

int nextFib()
{
   int result = f2;
   f0 = f1;
   f1 = f2;
   f2 = f0 + f1;
   return result;
}

void setup()
{
  for (int i = 0; i < 20;  i++)
  {
      println(nextFib());
  }
} 
