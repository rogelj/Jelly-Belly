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

enum Discount {
    public static let itemPrices: [Double] = [12.3, 11.5, 7.8, 9.5, 4.75, 8.9, 20.0]
    public static let discounts: [String:Double] = ["Default": 0.05, "Thanksgiving": 0.1, "Christmas": 0.15, "New Year": 0.2]
}

//: ## Assignment 1: Function**
//:
//: - Create a function with 2 parameters: `totalAmount` and `discountPercentage` (5%, 10% and so on).
//: - Calculate the `discountedAmount `and subtract this from the `totalAmount` (using formulae above).
//: - Return the `totalAmountAfterDiscount`.

// Naming this function `calculateDiscount_1` to enable for the overloading shown in Assignment 2 below
func calculateDiscount_1(for totalAmount: Double, discountPercentage: Double) -> Double {
    var discountedAmount: Double
    var totalAmountAfterDiscount: Double
    
    discountedAmount = totalAmount * discountPercentage
    totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount
}

calculateDiscount_1(for: 100, discountPercentage: Discount.discounts["Christmas"] ?? 0.0 )

//: ## Assignment 2: Function
//:
//: - Modify the function above to now take in a default discount percentage that will be applied by default to all. Hint: Use function overloading.

func calculateDiscount(totalAmount: Double, discountPercentage: Double = Discount.discounts["Default"] ?? 0.05) -> Double {
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

typealias GetDiscount = (Double, String) -> Double

// Bonus - Let us use the  typealias to overload our `calculateDiscount` function with the help of the following function:
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

func printDiscount(_ discount: GetDiscount, _ totalAmount: Double, _ discountType: String) {
    let result = discount(totalAmount, discountType)
    print("The discounted amount for \(discountType) is \(result).")
}

// testing:
printDiscount(holidayDiscount, 100, "Christmas")

// Printing the `totalAmountAfterDiscount` for all discount types:
Discount.discounts.keys.forEach { holiday in
    printDiscount(holidayDiscount, 100, holiday)
}


//: [Next](@next)
