class TestControl {

    // manager
    var m_curfunc : (( Bool ) -> Void )?
    var m_nextfunc: (( Bool ) -> Void )?
    var m_bNoWait = false
    func update()
    {
        while true {
            m_bNoWait = false
            var bFirst = false
            if m_nextfunc != nil
            {
                m_curfunc = m_nextfunc
                m_nextfunc = nil
                bFirst = true
            }
            if m_curfunc != nil 
            {
                m_curfunc?(bFirst);
            }
            if !m_bNoWait {
                break
            }
        }
    }
    func Goto( st : (( Bool ) -> Void)? )
    {
        m_nextfunc = st
    }
    func CheckState( st : (( Bool ) -> Void)? ) -> Bool
    {
        return st === m_curfunc
    }
    func HasNextState() -> Bool
    {
        return m_nextfunc != nil
    }
    func NoWait()
    {
        m_bNoWait = true
    }
    
    //state
    func S_START( bFirst : Bool )
    {
        if bFirst 
        {
            print("START S_START")
            Goto( st: S_END)
        }
    }

    func S_END( bFirst : Bool )
    {
        if bFirst
        {
            print("START S_END")
        }
    }

    //Run
    func Run()
    {
        print("RUN!")
        Goto( st: S_START)
        while !CheckState( st: S_END) 
        {
            update()
        }
        print("END")
    }
}

let sm = TestControl()
sm.Run()
