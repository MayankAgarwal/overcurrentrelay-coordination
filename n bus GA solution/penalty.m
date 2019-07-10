function [z, s, violation]= penalty(x)

    s=0;
    cond1 = 3.134*x(6) - 2.633*x(1) - 0.4;
    cond2 = 4.958*x(1) - 2.356*x(2) - 0.4;
    cond3 = 4.224*x(7) - 2.356*x(2) - 0.4;
    cond4 = 2.840*x(2) - 2.840*x(3) - 0.4;
    cond5 = 3.430*x(3) - 2.840*x(4) - 0.4;
    cond6 = 3.618*x(4) - 4.620*x(5) - 0.4;
    cond7 = 23.527*x(5) - 2.423*x(6) - 0.4;
    cond8 = 4.221*x(14) - 2.423*x(6) - 0.4;
    cond9 = 23.527*x(5) - 2.571*x(7) - 0.4;
    cond10 = 4.954*x(13) - 2.571*x(7) - 0.4;
    cond11 = 4.224*x(7) - 2.423*x(8) - 0.4;
    cond12 = 9.914*x(9) - 2.423*x(8) - 0.4;
    cond13 = 3.5*x(9) - 3.5*x(10) - 0.4;
    cond14 = 3.357*x(11) - 2.785*x(10) - 0.4;
    cond15 = 2.788*x(12) - 2.788*x(11) - 0.4;
    cond16 = 4.954*x(13) - 2.356*x(12) - 0.4;
    cond17 = 4.221*x(14) - 2.356*x(12) - 0.4;
    cond18 = 3.247*x(8) - 2.712*x(13) - 0.4;
    cond19 = 4.958*x(1) - 2.572*x(14) - 0.4;
    cond20 = 9.914*x(9) - 2.572*x(14) - 0.4;
    
    violation = [cond1 cond2 cond3 cond4 cond5 cond6 cond7 cond8 cond9 cond10 cond11 cond12 cond13 cond14 cond15 cond16 cond17 cond18 cond19 cond20]
    
    if (cond1>0)
        cond1=0;
        s=s+1;
    end
    
    if (cond2>0)
        cond2=0;
        s=s+1;
    end
    if (cond3>0)
        cond3=0;
        s=s+1;
    end
    if (cond4>0)
        cond4=0;
        s=s+1;
    end
    if (cond5>0)
        cond5=0;
        s=s+1;
    end
    if (cond6>0)
        cond6=0;
        s=s+1;
    end
    if (cond7>0)
        cond7=0;
        s=s+1;
    end
    if (cond8>0)
        cond8=0;
        s=s+1;
    end
    if (cond9>0)
        cond9=0;
        s=s+1;
    end
    if (cond10>0)
        cond10=0;
        s=s+1;
    end
    if (cond11>0)
        cond11=0;
        s=s+1;
    end
    if (cond12>0)
        cond12=0;
        s=s+1;
    end
    if (cond13>0)
        cond13=0;
        s=s+1;
    end
    if (cond14>0)
        cond14=0;
        s=s+1;
    end
    if (cond15>0)
        cond15=0;
        s=s+1;
    end
    if (cond16>0)
        cond16=0;
        s=s+1;
    end
    if (cond17>0)
        cond17=0;
        s=s+1;
    end
    if (cond18>0)
        cond18=0;
        s=s+1;
    end
    if (cond19>0)
        cond19=0;
        s=s+1;
    end
    if (cond20>0)
        cond20=0;
        s=s+1;
    end
    
    z = abs(cond1) + abs(cond2) + abs(cond3) + abs(cond4) + abs(cond5) + abs(cond6) + abs(cond7) + abs(cond8) + abs(cond9) + abs(cond10) + abs(cond11) + abs(cond12) + abs(cond13) + abs(cond14) + abs(cond15) + abs(cond16) + abs(cond17) + abs(cond18) + abs(cond19) + abs(cond20);

end