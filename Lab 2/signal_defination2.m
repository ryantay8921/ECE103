function op_signal=signal_defination2(time_var)

    

        if time_var < -5
            op_signal=0;
        elseif -5<=time_var & time_var<0
            op_signal=5;
        elseif 0<=time_var & time_var<5
            op_signal=10;
        else
            op_signal=0;
        end
  

end