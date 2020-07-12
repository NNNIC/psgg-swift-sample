class TestControl{

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
//  psggConverterLib.dll converted from TestControl.xlsx. 
                    case "S_0001": S_0001(bFirst)
                    case "S_0002": S_0002(bFirst)
                    case "S_0003": S_0003(bFirst)
                    case "S_0004": S_0004(bFirst)
                    case "S_END": S_END(bFirst)
                    case "S_START": S_START(bFirst)


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
//  psggConverterLib.dll converted from TestControl.xlsx. 
    /*
        E_0002
    */
    var a = 0
    /*
        S_0001
    */
    func S_0001(_ bFirst : Bool ) {
        if bFirst {
            a = a+1
        }
        print("S_0001")
        if  a==1 { Goto( "S_0002" ); }
        else if a==2 { Goto( "S_0003" ); }
        else { Goto( "S_0004" ); }
    }
    /*
        S_0002
    */
    func S_0002(_ bFirst : Bool ) {
        if bFirst {
            print("S_0002")
        }
        a += 1
        if !HasNextState()
        {
            Goto("S_0001");
        }
    }
    /*
        S_0003
    */
    func S_0003(_ bFirst : Bool ) {
        if bFirst {
            print("S_0003")
        }
        if !HasNextState()
        {
            Goto("S_END");
        }
    }
    /*
        S_0004
    */
    func S_0004(_ bFirst : Bool ) {
        if bFirst {
            print("S_0004")
        }
        if !HasNextState()
        {
            Goto("S_END");
        }
    }
    /*
        S_END
    */
    func S_END(_ bFirst : Bool ) {
    }
    /*
        S_START
    */
    func S_START(_ bFirst : Bool ) {
        if !HasNextState()
        {
            Goto("S_0001");
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
//let sm = TestControl()
//sm.Run()
