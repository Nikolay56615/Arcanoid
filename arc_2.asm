asect 0
main: ext               # Declare labels
default_handler: ext    # as external

# Interrupt vector table (IVT)
# Place a vector to program start and
# map all internal exceptions to default_handler
dc main, 0              # Startup/Reset vector
dc default_handler, 0   # Unaligned SP
dc default_handler, 0   # Unaligned PC
dc default_handler, 0   # Invalid instruction
dc default_handler, 0   # Double fault
align 0x80              # Reserve space for the rest 
                        # of IVT

# Exception handlers section
rsect exc_handlers

# This handler halts processor
default_handler>
    halt

# Main program section
rsect main

main>
#r4 - temporary register for x/y coordinate to pre-calculate
#r5 - has an adress of brick
#r6 - score
ldi r0,16 #x-coordinate
ldi r1,1 #x-velocity
ldi r2,28 #y-coordinate
ldi r3,-1 # y-velocity
ldi r6,0xcccc
while
    cmp r2,31
stays lt
    add r1,r0,r0

    ###checking block collision sideways section
    if
        cmp r2,8 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks8
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks7
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks7
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi

    if
        cmp r2,7 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks7
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks8
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks8
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi


    if
        cmp r2,5 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks5
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks4
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks4
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi

    if
        cmp r2,4 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks4
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks5
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks5
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi


    if
        cmp r2,2 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks2
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks1
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks1
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi

    if
        cmp r2,1 #checking for every row, if corner pixel has been beaten sboku or snizu - If because of adding x - sboku----------------------------------------
    is eq
        ldi r5, bricks1
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1, 1
        is eq # we need to know if this left or right pixel
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if
                cmp r1,1
            is eq # left pixel
                dec r1
                sub r5,2
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                ldi r5, bricks2
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                add r5,2
                st r5,r1
                add r5,2
                st r5,r1
                pop r1
                neg r1

            else #right pixel

                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5, bricks2
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r1
            fi
        else
            pop r1
        fi
    fi

    ###checking block collision sideways section ended--------------------------------------------------------------------




    #checking wall collisions by x-coordinate
    if
        cmp r0,32
    is ge
        neg r1
        dec r0
        dec r0
    fi
    if
        cmp r0,-1
    is le
        neg r1
        inc r0
        inc r0
    fi
    #move r4,r0

    ### checking collisions with upper wall
    add r2,r3,r2
    if
        cmp r2,-1
    is le
        neg r3
        inc r2
        inc r2
    fi


    if
        cmp r2,29
    is eq
        if
            cmp r1,0
        is eq
            dec r1
        fi
        ldi r5,0xbeef
        ld r5,r4 #now it has coordinate of bat
        if
            cmp r0,r4
        is eq
            neg r3
            neg r1
            #add r2,r3,r2
            #add r0,r1,r0
            
        else
            dec r4
            if
                cmp r0,r4
            is eq
                neg r3
                #add r2,r3,r2
                #add r0,r1,r0
                
            else
                dec r4
                if
                    cmp r0,r4
                is eq
                    neg r3
                    neg r1
                    #add r2,r3,r2
                    #add r0,r1,r0
                    
                else
                    #add r2,r3,r2
                fi
            fi
        fi
    fi



    ### y-checking collisions with blocks - above or below -------------------------------------------------------
    if
        cmp r2,8
    is eq
        ldi r5, bricks8
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks7
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks7
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks7
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi




    if
        cmp r2,7
    is eq
        ldi r5, bricks7
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks8
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks8
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks8
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi

    if
        cmp r2,5
    is eq
        ldi r5, bricks5
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks4
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks4
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks4
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi




    if
        cmp r2,4
    is eq
        ldi r5, bricks4
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks5
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks5
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks5
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi

    if
        cmp r2,2
    is eq
        ldi r5, bricks2
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks1
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks1
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks1
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi




    if
        cmp r2,1
    is eq
        ldi r5, bricks1
        add r5,r0,r5
        add r5,r0,r5
        push r1
        ld r5,r1
        if
            cmp r1,1
        is eq
            push r5
            ld r6,r5
            inc r5
            stb r6,r5
            pop r5
            add r5,2
            ld r5,r1
            if 
                cmp r1,1
            is eq
                sub r5,2
                sub r5,2
                ld r5,r1
                if
                    cmp r1,1
                is eq #check for middle pixel - correct
                    dec r1
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks2
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    sub r5,2
                    sub r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                else #left pixel - correct
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    ldi r5,bricks2
                    add r5,r0,r5
                    add r5,r0,r5
                    st r5,r1
                    add r5,2
                    st r5,r1
                    add r5,2
                    st r5,r1
                    pop r1
                    neg r3
                    #add r3,r2
                fi

            else #right pixel - correct
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                ldi r5,bricks2
                add r5,r0,r5
                add r5,r0,r5
                st r5,r1
                sub r5,2
                st r5,r1
                sub r5,2
                st r5,r1
                pop r1
                neg r3
                #add r3,r2
            fi
        else
            pop r1
        fi
    fi
    ### y-checking collisions with blocks - above or below -------------------------------------------------------


    #move r4,r2    
wend
halt
asect 0xdead #added this adress to check it in logisim RAM
bricks1: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0
bricks2: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0

bricks4: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0
bricks5: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0

bricks7: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0
bricks8: dc 0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0
end.
# need to change coordinate system, because in this version ball can only reflect by corner of brick