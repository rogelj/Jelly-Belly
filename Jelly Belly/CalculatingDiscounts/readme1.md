# Week 3 - Assignment

**Properties/ Data/ Formulae student needs:**

- **itemPrices**: An array containing prices of 7 (or any number of) items.
- **totalAmount**: Total amount of all items before applying discount. (A single value.)
- **discountPercentage**: A percentage discount number. For example: 5%, 10%.
- **discountType**: Type of discount to be applied on an item. Discount types could be Default discount (5%), Thanksgiving discount (10%), Christmas discount (15%), New year discount (20%).
- **discountedAmount**: Amount after applying `discount` on `totalAmount`. Formula: `totalAmount * 0.5` (if a discount of 5% is applied).
- **totalAmountAfterDiscount**: `totalAmount - discountedAmount`.

**Note**: We may use the playground for some of these assignments. The code that best fits in the app finally goes to the app (Protocols, extensions, classes, methods).

**Introduction:**

We will work on calculating discounts this week. There can be different ways of doing the same thing. For example: one could use a function/ computed property/ closure/ method to calculate discount. The idea of this week's assignment is to grasp all these concepts well as they form the core logic of an app. Students can use a playground to play around with these concepts. As a final step, the code that best fits in the app goes there. For the **Minimal contact restaurant**: Calculate discount on the total bill
based on holiday season.

**Assignments**

**Need to have:**

- [x]  **Assignment 1: Function**

- Create a function with 2 parameters: `totalAmount` and `discountPercentage` (5%, 10% and so on).

- Calculate the `discountedAmount `and subtract this from the `totalAmount `(using formulae above).

- Return the `totalAmountAfterDiscount`.

- [x]  **Assignment 2: Function**

- Modify the function above to now take in a default discount percentage that will be applied by default to all. Hint: Use function overloading.

- [x]  **Assignment 3: typealias**

- Create a typealias for a function type that takes in `totalAmount `and
`discount `type as parameters. It returns the `totalAmountAfterDiscount`. Hint: `(Double, String) -> Double`
- Now create a `printDiscount` function to print the `totalAmountAfterDiscount` for all discount types. It takes function (typealias) as a parameter

- [x] **Assignment 4: Closure**

- Create a closure that calculates the discount. Closures takes parameters as: total amount, discount type and subtracts discounted amount from total amount and prints the total amount.

- [x] **Assignment 5: Map**

- Take itemPrices. Let's say the prices of all of these items are to be increased by 50%. Multiply each element in an array with 0.5. Print the new item price.

  For example: Price of item 1 is \$100. Price of item 1 is to be increased by 50% (that's \$100 * 0.5 = $50). The new price of item 1 is now \$150. Hint: Use Swift's map

- [x] **Assignment 6: Sorted**

- Create a Discount type dictionary (with discount type and percentage amount). Sort this dictionary from highest discount to lowest discount. Hint: Use Swift's sorted.

- [x] **Assignment 7: Enums and Switch cases**

- Use enums for discount types.

- Create a function printDiscount to print the value for discount types. Use switch cases and enums to do this.

- [x] **Assignment 8: Computed property**

- Create a computed property: `currentDiscountedAmount` that returns the current discounted amount that you apply on the `itemPrices`. 
  
  For example: you have a subset of itemPrices that the user chooses to buy (of course, at a later point, you can hardcode this chosen itemPrices subset for now). Based on the season - let's say right now, there is a Christmas sale going on and a discount (of 15%) is applied to the `itemPrices` in this season. Then the `currentDiscountedAmount = totalAmountAfterDiscount`.

- [x] **Assignment 9: Lazy property**

- Create a lazy property that returns the maximum discount that can be applied.

- [x]  **Assignment 10: Method**

- Create a method that calculates and returns `totalAmountAfterDiscount`. Hint: Method belongs to a class/ struct/ enum.

- [x] **Assignment 11: Protocol**

- Create a protocol and class for Discount that has DiscountType and DiscountPercentage and a method to calculate discount.

- [x]  **Assignment 12: Extension**

- Create an extension that rounds off the `totalDiscountedAmount`.

  For example: Apply a logic if the `totalDiscountedAmount` = 50.6, it rounds off to 51 (decimal >=0.5) and if the `totalDiscountedAmount` < 0.5, it rounds off to 50 (decimal < 0.5) Hint: Double amount is rounded off to a closest int.

**Mandatory:**

**Assignment 13: Final code goes in the app**

- The code that best fits in the app goes to where it belongs. :]

**Nice to have:**

- [x] - Showcase the progression of the usage of a closure from the longest syntax to the shortest possible syntax (You can use the closure that you created in assignment 4.) **OR**
- [x] - Display a date or a string (preferably a long string) in a nice readable format using NSAttributedString. Use your creativity and make the date/ string look appealing using different fonts/ colors.
