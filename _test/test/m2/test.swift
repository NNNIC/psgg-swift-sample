class TestControl {
    // manager
    var m_curstate  : String? = nil
    var m_nextstate : String? = nil
    var m_noWait = false

    func Update() {
        while true {
            var bFirst = false;
            if m_nextstate != nil {
                m_curstate = m_nextstate
                m_nextstate = nil
                bFirst = true
            }
            if  m_curstate != nil {
                switch m_curstate {
                    case "S_START" : S_START(bFirst)
                    case "S_S0001" : S_S0001(bFirst)
                    case "S_END"   : S_END(bFirst)
                    default: print("Unexpected!")
                }
            }
            if !m_noWait { break }
        }
    }
    func Goto( _ st: String) {
        m_nextstate = st;
    }
    func CheckState(_ st: String) -> Bool {
        return m_curstate == st
    }
    func HasNextState() -> Bool {
        return m_nextstate != nil
    }
    func NoWait() {
        m_noWait = true
    }

    // state
    func S_START(_ bFirst : Bool) {
        if bFirst {
            print("START S_START")
            Goto("S_S0001")
        }
    }
    func S_S0001(_ bFirst : Bool) {
        if bFirst {
            print("START S_S0001")
            Goto("S_END")
        }
    }
    func S_END(_ bFirst : Bool) {
        if bFirst {
            print("START S_END")
        }
    }

    //Run
    func Run() -> Void {
        print("RUN!")
        Goto( "S_START" )
        while CheckState( "S_END" ) == false {
            print(".")
            Update()
        }
        print("END OF RUN")
    }
}
let sm = TestControl()
sm.Run()
