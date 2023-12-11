import UIKit

class BankAccount{
    var accountBalance: Float = 0;
    var accountNumber: Int = 0;
    let fees: Float = 25.00;
    
    init (number: Int, balance: Float)
    {
        accountNumber = number;
        accountBalance = balance;
    }
    
    class func getMaxBalance()
    -> Float {
        return 10000.0
    }
    
    func displayBalance(){
        print("Number \(accountNumber)");
    }
    
    var balanceLessFees: Float {
        get {
            return accountBalance - fees;
        }
        
        set (newBalance){
            accountBalance = newBalance - fees;
        }
    }
}

class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0;
    
    init(number: Int, balance: Float, rate: Float)
    {
        interestRate = rate;
        super.init(number: number, balance: balance);
    }
    
    func calculateInterest() -> Float{
        return interestRate * accountBalance;
    }
    
    override func displayBalance()
    {
        super.displayBalance();
        print("Prevailing interest rate is \(interestRate)");
    }
}


// Bank Account
var account1: BankAccount = BankAccount (number: 1234, balance: 200)
//account1.displayBalance()

//var balance1 = account1.accountBalance
//account1.accountBalance;
//
////account1.displayBalance();
//var maxAllowed = BankAccount.getMaxBalance();
//print(maxAllowed)

var balance1 = account1.balanceLessFees
account1.balanceLessFees = 12123.23;




// Savings Account
var savingAccount1 = SavingsAccount(number: 12, balance: 1200, rate: 0.07);
print(savingAccount1.calculateInterest());
savingAccount1.displayBalance();
