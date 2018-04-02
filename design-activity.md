
1. What classes does each implementation include? Are the lists the same?


Yes both implementations have the same classes: CartEntry, ShoppingCart and Order.

2. Write down a sentence to describe each class.

For Implementation A:
CartEntry assigns the variables unit_price and quantity and gives access to them from outside the class.
ShoppingCart is in charge of the entries in the cart and gives access to it from outside.
Order instantiate a new instance of ShoppingCart and it calculates all the entries in it making use of the constant SALES_TAX.

For Implementation B:
CartEntry assigns the variables unit_price and quantity, but also calculates the price based on unit_price and quantity.
ShoppingCart is in charge of the entries but also calculates the price for all entries.
Order creates a new instance of Shopping Cart and calculates the total_price by using SALES_TAX and the method price from the ShoppingCart.

3. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

In Implementation A:
ShoppingCart stores instances of entries and then Order has an instance of shopping cart and calculates the price of each entry.

In Implementation B:
ShoppingCart also gets the price of every entry and adds them to get the sum of the shopping cart. Then the Order gets an instance of ShoppingCart and calculates the total_price with tax.

4. What data does each class store? How (if at all) does this differ between the two implementations?

 In implementation A only the class Order has the responsibility of calculating total_cost. Order does all the work in this implementation.

 In implementation B CartEntry calculates price, ShoppingCart returns sum and Order returns total_price.So each class does some work


5. What methods does each class have? How (if at all) does this differ between the two implementations?
All classes have initialize methods. In implementation A only the class Order has a total_price.
However in implementation B the CartEntry and the ShoppingCart have price methods and the Order has a total_price method.

In Implementation B each class has their own responsibilities, while in Implementation A class Order does all the work



6. Consider the Order#total_price method. In each implementation:
  Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

  In Implementation A the price is retained in Order.
  In Implementation B it is delegated to "lower level" classes.

  Does total_price directly manipulate the instance variables of other classes?
  Yes for A and No for B.


7. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

I believe B will be easier to change, since we could add it to the price method of the class CartEntry.

8. Which implementation better adheres to the single responsibility principle?

I think in implementation B by giving more responsibility to the lower classes.

9. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

In implementation B the classes are more loosely coupled, so class B has less dependency with the other classes.

>>>>>Revisiting Hotel>>>>>>

1. What is this class's responsibility?
  You should be able to describe it in a single sentence.
2. Is this class responsible for exactly one thing?
3. Does this class take on any responsibility that should be delegated to "lower level" classes?
4. Is there code in other classes that directly manipulates this class's instance variables?


I have not done Wave 3 of Hotel, but I only have 3 classes and I believe they all have their own responsibilities, and I should not have to delegate to other "lower level" classes. My frontdesk and reservation classes do all the work, but i feel like they both handle their own responsibilities.
