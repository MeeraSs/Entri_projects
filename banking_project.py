class BankAccount:
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.balance = 0

    def login(self, entered_username, entered_password):
        if entered_username == self.username and entered_password == self.password:
            return True
        else:
            return False

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Amount {amount} deposited. Current balance: {self.balance}")
        else:
            print("Invalid amount. Please deposit a positive amount.")

    def withdraw(self, amount):
        if amount > 0 and amount <= self.balance:
            self.balance -= amount
            print(f"Amount {amount} withdrawn. Current balance: {self.balance}")
        else:
            print("Invalid amount or insufficient balance.")


user_account = BankAccount("Meera", "12345")

# Logging in
entered_username = input("Enter username: ")
entered_password = input("Enter password: ")

if user_account.login(entered_username, entered_password):
    print("Login successful!")
    while True:
        print("\nChoose an option:")
        print("1. Deposit")
        print("2. Withdraw")
        print("3. Exit")

        choice = input("Enter your choice (1/2/3): ")

        if choice == '1':
            amount_to_deposit = float(input("Enter amount to deposit: "))
            user_account.deposit(amount_to_deposit)
        elif choice == '2':
            amount_to_withdraw = float(input("Enter amount to withdraw: "))
            user_account.withdraw(amount_to_withdraw)
        elif choice == '3':
            break
        else:
            print("Invalid choice. Please enter a valid option.")

else:
    print("Invalid credentials. Login failed.")
