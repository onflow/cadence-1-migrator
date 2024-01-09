
access(all)
contract Test {

    access(all)
    let address: String

    init(x: auth(Storage, Keys, Capabilities) &Account) {
        self.address = x.address.toHex()
    }

    access(all)
    view fun fun1(): String {
        return self.address
    }

    access(all)
    fun fun2(accounts: [Capability<&Account>]) {}

    access(all)
    fun fun3() {
        post {
            Test.fun1() =="123"
        }
    }   

    access(all)
    fun fun5() {
        let number = 1
        let ref = &number as &Int
    }

    access(all)
    fun renamedFuncForContinue() {}

    access(all)
    fun fun6() {
        let someNum: UInt128 = 123456789
        let someBytes: [UInt8] = someNum.toBigEndian()
    }

    access(all)
    fun fun7() {
        var baz: fun (Int, Int): Int16 = Test.fun4
    }
}
