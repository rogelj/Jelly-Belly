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
enum Discount {
    // Defining a defaultDiscount to be used in the app
    public static let defaultDiscount: Double = 0.05
    public static let itemPrices: [Double] = [12.3, 11.5, 7.8, 9.5, 4.75, 8.9, 20.0]
    
    // Defining a dictionary here to be used for Assignment 6
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

calculateDiscount(for: 100, discountPercentage: Discount.discounts["Christmas"] ?? 0.0 )

//: ## Assignment 2: Function
//:
//: - Modify the function above to now take in a default discount percentage that will be applied by default to all. Hint: Use function overloading.

func calculateDiscount(totalAmount: Double, discountPercentage: Double =  Discount.defaultDiscount) -> Double {
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

//: [JRogel]: I read this as having to create a function that returns the `totalAmointAfterDiscount` but uses the typealias as the signature of the function.
//: Here we go:

typealias GetDiscount = (Double, String) -> Double

// Let us now use the typealias to overload our `calculateDiscount` function with the help of the following function:
func holidayDiscount(totalAmount: Double, discountType: String) -> Double {
    totalAmount * (1 - (Discount.discounts[discountType] ?? 0.0) )
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
Discount.discounts.keys.forEach { holiday in
    printDiscount(holidayDiscount, 100, holiday)
}

//: Assignment 4: Closure
//:
//: - Create a closure that calculates the discount. Closures takes parameters as: total amount, discount type and subtracts discounted amount from total amount and prints the total amount.

//: Starting with a long closure syntax - NICE TO HAVE!!
var discountClosure: GetDiscount = { (totalAmount: Double, discountType: String) -> Double in
    let totalAmountAfterDiscount: Double
    
    totalAmountAfterDiscount = totalAmount * (1 - (Discount.discounts[discountType] ?? 0.0) )
    print("The discounted amount for \(discountType) is \(totalAmountAfterDiscount).")
    return totalAmountAfterDiscount
}

var testDiscountClosure = discountClosure(100, "Christmas")
print(testDiscountClosure)



//: [Next](@next)
