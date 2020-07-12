class TestControl{

    // manager
    var m_curstate  : String? = nil
    var m_nextstate : String? = nil
    var m_noWait = false
    let MAX_CALL_STACK = 10
                                // 1   2   3   4   5   6   7   8   9   10
    var m_callstack : [String?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    var m_callstack_level = 0

    func Update() {
        while true {
            m_noWait = false
            var bFirst = false
            if m_nextstate != nil {
                m_curstate = m_nextstate
                m_nextstate = nil
                bFirst = true
            }
            if  m_curstate != nil {
                switch m_curstate {
                    //[STATEGO OUTPUT START] indent(20) $/^S_/->#case$
                    //             psggConverterLib.dll converted from psgg-file:TestControl.psgg

                    case "S_END": S_END(bFirst)
                    case "S_GSB000": S_GSB000(bFirst)
                    case "S_HELLOWORLD": S_HELLOWORLD(bFirst)
                    case "S_HELLOWORLD2": S_HELLOWORLD2(bFirst)
                    case "S_HELLOWORLD3": S_HELLOWORLD3(bFirst)
                    case "S_HELLOWORLD4": S_HELLOWORLD4(bFirst)
                    case "S_HELLOWORLD5": S_HELLOWORLD5(bFirst)
                    case "S_LOP000": S_LOP000(bFirst)
                    case "S_LOP000_LoopCheckAndGosub____" : S_LOP000_LoopCheckAndGosub____(bFirst)
                    case "S_LOP000_LoopNext____" : S_LOP000_LoopNext____(bFirst)
                    case "S_NEWERA": S_NEWERA(bFirst)
                    case "S_RET000": S_RET000(bFirst)
                    case "S_RET001": S_RET001(bFirst)
                    case "S_SBS000": S_SBS000(bFirst)
                    case "S_SBS001": S_SBS001(bFirst)
                    case "S_START": S_START(bFirst)
                    case "S_SUBROUTINE": S_SUBROUTINE(bFirst)
                    case "S_SUBROUTINE1": S_SUBROUTINE1(bFirst)


                    //[STATEGO OUTPUT END]                    
                    default: print("Unexpected!")
                }
            }
            if !m_noWait { break }
        }
    }
    func Goto(_ st: String?) {
        m_nextstate = st;
    }
    func CheckState(_ st: String?) -> Bool {
        return m_curstate == st
    }
    func HasNextState() -> Bool {
        return m_nextstate != nil
    }
    func NoWait() {
        m_noWait = true
    }
    func GoSubState(_ sub: String?, next: String?) {
 	    if m_callstack_level >= MAX_CALL_STACK-1 {
		    print("CALL STACK OVER FLOW")
	    }
        else {
            m_callstack[m_callstack_level] = next;
            m_callstack_level += 1
            Goto(sub)      
        }
    }
    func ReturnState()
    {
	    var st: String? = nil;
        if m_callstack_level <= 0 {
		    print("CALL STACK UNDER FLOW")
	    }
        else {
            m_callstack_level -= 1
            st = m_callstack[m_callstack_level]
            Goto(st)
        }
    }

    // state
    //[STATEGO OUTPUT START] indent(4) $/./$
    //             psggConverterLib.dll converted from psgg-file:TestControl.psgg

    /*
        S_END
    */
    func S_END(_ bFirst : Bool ) {
         // end of state machine
    }
    /*
        S_GSB000
    */
    func S_GSB000(_ bFirst : Bool ) {
        GoSubState("S_SBS000", next: "S_LOP000")
        NoWait()
    }
    /*
        S_HELLOWORLD
    */
    func S_HELLOWORLD(_ bFirst : Bool ) {
        if bFirst {
            print("Hello World.")
        }
        if !HasNextState()
        {
            Goto("S_NEWERA");
        }
    }
    /*
        S_HELLOWORLD2
    */
    func S_HELLOWORLD2(_ bFirst : Bool ) {
        if bFirst {
            print("index = " + String(m_index) + " : result = First.")
        }
        if !HasNextState()
        {
            Goto("S_RET001");
        }
    }
    /*
        S_HELLOWORLD3
    */
    func S_HELLOWORLD3(_ bFirst : Bool ) {
        if bFirst {
            print("index = " + String(m_index) + " : result = Second.")
        }
        if !HasNextState()
        {
            Goto("S_RET001");
        }
    }
    /*
        S_HELLOWORLD4
    */
    func S_HELLOWORLD4(_ bFirst : Bool ) {
        if bFirst {
            print("index = " + String(m_index) + " : result = Third.")
        }
        if !HasNextState()
        {
            Goto("S_RET001");
        }
    }
    /*
        S_HELLOWORLD5
    */
    func S_HELLOWORLD5(_ bFirst : Bool ) {
        if bFirst {
            print("index = " + String(m_index) + " : result = " + String(m_val))
        }
        if !HasNextState()
        {
            Goto("S_RET001");
        }
    }
    /*
        S_LOP000
    */
    var m_index = 0
    func S_LOP000(_ bFirst : Bool )
    {
        m_index = 0
        Goto("S_LOP000_LoopCheckAndGosub____")
        NoWait()
    }
    func S_LOP000_LoopCheckAndGosub____(_ bFirst : Bool )
    {
        if m_index < 10 {
            GoSubState("S_SBS001", next: "S_LOP000_LoopNext____")
        }
        else {
            Goto("S_END")
        }
        NoWait()
    }
    func S_LOP000_LoopNext____(_ bFirst : Bool )
    {
        m_index += 1
        Goto("S_LOP000_LoopCheckAndGosub____")
        NoWait()
    }
    /*
        S_NEWERA
    */
    func S_NEWERA(_ bFirst : Bool ) {
        if bFirst {
            print("We are in the visual programming era.")
        }
        if !HasNextState()
        {
            Goto("S_GSB000");
        }
    }
    /*
        S_RET000
    */
    func S_RET000(_ bFirst : Bool ) {
        ReturnState()
        NoWait()
    }
    /*
        S_RET001
    */
    func S_RET001(_ bFirst : Bool ) {
        ReturnState()
        NoWait()
    }
    /*
        S_SBS000
    */
    func S_SBS000(_ bFirst : Bool ) {
        if !HasNextState()
        {
            Goto("S_SUBROUTINE");
        }
    }
    /*
        S_SBS001
    */
    func S_SBS001(_ bFirst : Bool ) {
        if !HasNextState()
        {
            Goto("S_SUBROUTINE1");
        }
    }
    /*
        S_START
    */
    func S_START(_ bFirst : Bool ) {
        Goto("S_HELLOWORLD")
        NoWait()
    }
    /*
        S_SUBROUTINE
    */
    func S_SUBROUTINE(_ bFirst : Bool ) {
        if bFirst {
            print("It is a subroutine.")
        }
        if !HasNextState()
        {
            Goto("S_RET000");
        }
    }
    /*
        S_SUBROUTINE1
    */
    var m_val = 0
    func S_SUBROUTINE1(_ bFirst : Bool ) {
        if bFirst {
            m_val = Int.random(in: 1..<8)
        }
        if  m_val == 1 { Goto( "S_HELLOWORLD2" ); }
        else if m_val == 2 { Goto( "S_HELLOWORLD3" ); }
        else if m_val == 3 { Goto( "S_HELLOWORLD4" ); }
        else { Goto( "S_HELLOWORLD5" ); }
    }


    //[STATEGO OUTPUT END]

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
