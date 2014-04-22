/**Snippet for Triangular Number

A triangular number or triangle number counts the objects that can form an equilateral triangle, as in the diagram on the right. The nth triangle number is the number of dots composing a triangle with n dots on a side, and is equal to the sum of the n natural numbers from 1 to n. The sequence of triangular numbers (sequence A000217 in OEIS), starting at the 0th triangular number, is:

    0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120 … 
    
*/

void setup()
{
  println("TN : "+getTriangularNumber(10));
}

void draw()
{
}

int getTriangularNumber(int number) {
  println("methode n°"+number);
  if (number == 1)
  {
    println("Returned 1");
    return 1;
  }
  else
  {
    int result = number + getTriangularNumber(number - 1);
    println("Result returned : "+result+" : "+number+"+ getTN("+number+"-1);");
    return result;
  }
}

