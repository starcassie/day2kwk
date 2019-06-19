// bank abount class
// attributes: name, type, number, money

class BankAccount {
    
    // attributes
    var name: String
    var transferNumber: Int
    var accountBalance: Double
    var password: String
    var pin: Int
    
    // initialize
    init(personName: String, number: Int, pass: String, pi: Int, money: Double) {
        name = personName
        transferNumber = number
        password = pass
        pin = pi
        if (money > 0) {
            accountBalance = money
        } else {
            accountBalance = 0
        }
    }
    
    // set func
    func deposit(amount: Double) {
        accountBalance += amount
    }
    func withdrawal(amount: Double, pass: String) {
        if (pass == password) {
            if (amount <= accountBalance) {
                accountBalance -= amount
            } else {
                print("not enough money")
            }
        } else {
            print("invalid password")
        }
    }
    func transfer(amount: Double, pass: String, personNum: Int) {
        if (pass == password) {
            if (amount <= accountBalance) {
                var index = 0;
                for peep in accounts {
                    if (peep.transferNumber == personNum) {
                        accounts[index].deposit(amount: amount)
                        withdrawal(amount: amount, pass: pass)
                        break
                    }
                    index += 1
                }
            }
            
        }
        print("money transfered")
        print()
    }
    
    func transferRevised(from: BankAccount, to: BankAccount, toTransferNum: Int, pass: String, amount: Double) {
        if (pass == from.getPassword()) {
            if (amount <= from.getAccountBalance()) {
                if (to.transferNumber == toTransferNum) {
                    from.withdrawal(amount: amount, pass: pass)
                    to.deposit(amount: amount)
                }
            }
            
        }
        print("money transfered")
        print()
    }
    
    // wrapper
    func getName() -> String{
        return(name)
    }
    func getAccountBalance() -> Double {
        return(accountBalance)
    }
    func  getTransferNumber() -> Int {
        return(transferNumber)
    }
    func getPassword() -> String {
        return(password)
    }
    func getPin() -> Int {
        return(pin)
    }
    
    // display account
    func displayAccount() {
        print(name)
        print(transferNumber)
        print("$\(accountBalance)")
        print("password: " + password)
        print("pin: \(pin)")
        print()
    }
    
    //display accounts
    func loop(accounts: [BankAccount]) {
        for index in 0..<accounts.count {
            print(accounts[index].getName())
        }
    }
}

// list of accounts
var accounts = [BankAccount]()
// creats accounts
var account1 = BankAccount(personName: "Cassandra Areff", number: 124, pass: "cassie", pi: 3333, money: 1000000000)
var account2 = BankAccount(personName: "Justin Wong", number: 123, pass: "aba", pi: 1234, money: 1000000000)
// displays acount1
account1.displayAccount()
// adds accounts to list
accounts.append(account1)
accounts.append(account2)
// transfers money
// account1.transfer(amount: 200, pass: "cassie", personNum: 123)
// transfers money
// account1.transferRevised(from: account1, to: account2, toTransferNum: 123, pass: "cassie", amount: 200)
// transfer all money to cassie
account1.transferRevised(from: account2, to: account1, toTransferNum: 124, pass: "aba", amount: 1000000000)
// diplays acounts 1 and 2
account1.displayAccount()
account2.displayAccount()
account1.loop(accounts: accounts)
