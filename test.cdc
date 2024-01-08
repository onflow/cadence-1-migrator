pub contract Test {

    pub let address: String

    pub init(x: AuthAccount) {
        self.address = x.address.toString()
    }

    pub fun fun1(): String {
        return self.address
    }

    pub fun fun2(accounts: [Capability<&AuthAccount>]) {}

    pub fun fun3() {
        post {
            Test.fun1() == "123"
        }
    }   

    pub fun fun5() {
        let number = 1
        let ref = &number as! &Int
    }

    pub fun continue() {}

    pub fun fun6() {
        let someNum: UInt128 = 123456789
        let someBytes: [UInt8] = someNum.toBigEndianBytes()
    }

    pub fun fun7() {
        var baz: ((Int, Int): Int16) = Test.fun4
    }
}
