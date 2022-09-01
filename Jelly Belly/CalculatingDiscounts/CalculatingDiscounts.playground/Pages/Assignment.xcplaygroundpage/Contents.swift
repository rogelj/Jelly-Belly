//: [Previous](@previous)

//: Pre-requisites
//:
//: - `itemPrices`: An array containing prices of 7 (or any number of) items.
//: - `discounts`: A dictionary with `discountType`:`discounrPercentage` pairs:
//:     - `discountType`: Type of discount to be applied on an item. Discount types could be Default discount (5%), Thanksgiving discount (10%), Christmas discount (15%), New year discount (20%).
//:     - `discountPercentage`: A percentage discount number. For example: 5%, 10%.


//: Calculated amounts:
//: - `totalAmount`: Total amount of all items before applying discount. (A single value.)
//: - `discountedAmount`: Amount after applying `discount` on `totalAmount`. Formula: `totalAmount * 0.5` (if a discount of 5% is applied).
//: - `totalAmountAfterDiscount`: `totalAmount - discountedAmount`.


//: [JRogel]: Creating an `enum` to hold the prerequisites.
enum DiscountConstants {
    // Defining a defaultDiscount to be used in the app
    public static let defaultDiscount: Double = 0.05
    
    public static let itemPrices: [Double] = [12.3, 11.5, 7.8, 9.5, 4.75, 8.9, 20.0]
    
    // Defining a dictionary - This will be used later for Assignment 6
    public static let discounts: [String:Double] = ["Default": defaultDiscount, "Thanksgiving": 0.1, "Christmas": 0.15, "New Year": 0.2]
}

//: ## Assignment 1: Function
//:
//: - Create a function with 2 parameters: `totalAmount` and `discountPercentage` (5%, 10% and so on).
//: - Calculate the `discountedAmount `and subtract this from the `totalAmount` (using formulae above).
//: - Return the `totalAmountAfterDiscount`.

// Naming this function `calculateDiscount`. If necessary comment this code out.
func calculateDiscount(for totalAmount: Double, discountPercentage: Double) -> Double {
    var discountedAmount: Double
    var totalAmountAfterDiscount: Double
    
    discountedAmount = totalAmount * discountPercentage
    totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount
}

calculateDiscount(for: 100, discountPercentage: DiscountConstants.discounts["Christmas"] ?? 0.0 )

//: ## Assignment 2: Function
//:
//: - Modify the function above to now take in a default discount percentage that will be applied by default to all. Hint: Use function overloading.

func calculateDiscount(totalAmount: Double, discountPercentage: Double =  DiscountConstants.defaultDiscount) -> Double {
    let discountedAmount: Double
    let totalAmountAfterDiscount: Double
    
    discountedAmount = totalAmount * discountPercentage
    totalAmountAfterDiscount = totalAmount - discountedAmount

    return totalAmountAfterDiscount
}

calculateDiscount(totalAmount: 100)
calculateDiscount(totalAmount: 100, discountPercentage: 0.5)

//: ## Assignment 3: typealias
//:
//: - Create a `typealias` for a function type that takes in `totalAmount` and `discountType` as parameters. It returns the `totalAmountAfterDiscount`. Hint: (Double, String) -> Double

//: [JRogel]: I clarified in the session, I am creating a function that returns the `totalAmointAfterDiscount` but uses the typealias as the signature of the function.
//: Here we go:

typealias GetDiscount = (Double, String) -> Double

// Let us now use the typealias to overload our `calculateDiscount` function with the help of the following function:
func holidayDiscount(totalAmount: Double, discountType: String) -> Double {
    totalAmount * (1 - (DiscountConstants.discounts[discountType] ?? 0.0) )
}

// Overloading `calculateDiscount`
func calculateDiscount(_ discount: GetDiscount, _ totalAmount: Double, _ discountType: String) -> Double {
    let result = discount(totalAmount, discountType)
    return result
}

calculateDiscount(holidayDiscount, 100, "Thanksgiving")

//: - Now create a `printDiscountfunction` to print the `totalAmountAfterDiscount` for all discount types. It takes function (typealias) as a parameter

//: [JRogel]: I read this as creating a function that then I can use to print the `totalAmountAfterDiscount` upon request:

func printDiscount(_ discount: GetDiscount, _ totalAmount: Double, _ discountType: String) {
    let result = discount(totalAmount, discountType)
    print("The discounted amount for \(discountType) is \(result).")
}

//: Testing:
printDiscount(holidayDiscount, 100, "Christmas")

//:  Printing the `totalAmountAfterDiscount` for all discount types. I am using `forEach` to do this:
DiscountConstants.discounts.keys.forEach { holiday in
    printDiscount(holidayDiscount, 100, holiday)
}

//: Assignment 4: Closure
//:
//: - Create a closure that calculates the discount. Closures takes parameters as: total amount, discount type and subtracts discounted amount from total amount and prints the total amount.

//: Starting with a long closure syntax - NICE TO HAVE!!
var discountClosure: GetDiscount = { (totalAmount: Double, discountType: String) -> Double in
    let totalAmountAfterDiscount: Double
    
    totalAmountAfterDiscount = totalAmount * (1 - (DiscountConstants.discounts[discountType] ?? 0.0) )
    print("The discounted amount for \(discountType) is \(totalAmountAfterDiscount).")
    return totalAmountAfterDiscount
}

var testDiscountClosure = discountClosure(100, "Christmas")
print(testDiscountClosure)

//: As part of the NICE TO HAVE I am rewritting the closure with no parameter names and return type
var shortDiscountClosure: GetDiscount = {
    let totalAmountAfterDiscount = $0 * (1 - (DiscountConstants.discounts[$1] ?? 0.0) )
    print("The discounted amount for \($0) is \(totalAmountAfterDiscount).")
    return totalAmountAfterDiscount
}

shortDiscountClosure(100, "Christmas")


//: Assignment 5: Map
//:
//: - Take `itemPrices`. Let's say the prices of all of these items are to be increased by 50%. Multiply each element in an array with 0.5. Print the new item price.
//:
//:  For example: Price of item 1 is $100. Price of item 1 is to be increased by 50% (that's $100 * 0.5 = $50). The new price of item 1 is now $150. Hint: Use Swift's map

let increaseAmount = 0.5

var increasedItemPrices = DiscountConstants.itemPrices.map { (price) -> Double in
    price * ( 1 + increaseAmount)
}

print("Before discount: \(DiscountConstants.itemPrices)")
print("After discount: \(increasedItemPrices)")

//: Assignment 6: Sorted
//:
//: - Create a Discount type dictionary (with discount type and percentage amount). Sort this dictionary from highest discount to lowest discount. Hint: Use Swift's sorted.


let sortedDiscountTypes = DiscountConstants.discounts.sorted {
    return $0.value > $1.value
}

print(sortedDiscountTypes)

// Or in a nicer way:
sortedDiscountTypes.forEach { dt in
    print("The discount for \(dt.key) is \(dt.value)")
}

//: Assignment 7: Enums and Switch cases
//:
//: - Use enums for discount types.
//: - Create a function printDiscount to print the value for discount types. Use switch cases and enums to do this.



//: [Next](@next)
