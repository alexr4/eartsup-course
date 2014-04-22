/**Snippet for Factorial Number

In mathematics, the factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n. For example,
    ex = F(5) = 5 * 4* 3* 2* 1 = 120
*/

void setup()
{
  println("TN : "+getFactorialNumber(6));
}

void draw()
{
}

int getFactorialNumber(int number) {
  println("methode n°"+number);
  if (number == 1)
  {
    println("Returned 1");
    return 1;
  }
  else
  {
    int result = number * getFactorialNumber(number - 1);
    println("Result returned : "+result+" : "+number+"* getTN("+number+"-1);");
    return result;
  }
}

