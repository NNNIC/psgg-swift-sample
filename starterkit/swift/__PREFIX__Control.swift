class __PREFIX__Control{

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
                    //[SYN-G-GEN OUTPUT START] indent(20) $/^S_/->#case$
                    case "S_START": S_START(bFirst)
                    case "S_END"  : S_END(bFirst)            
                    //[SYN-G-GEN OUTPUT END]                    
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
    //[SYN-G-GEN OUTPUT START] indent(4) $/./$
    func S_START(_ bFirst : Bool) {
        if bFirst {
            print("START S_START")
            Goto("S_END")
        }
    }
    func S_END(_ bFirst : Bool) {
        if bFirst {
            print("START S_END")
        }
    }
    //[SYN-G-GEN OUTPUT END]

    //Run
    func Run() -> Void {
        print("RUN!")
        Goto( "S_START" )
        while CheckState( "S_END" ) == false {
            Update()
        }
        print("END OF RUN")
    }
}
//let sm = __PREFIX__Control()
//sm.Run()
