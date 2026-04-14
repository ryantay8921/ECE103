function op_signal=signal_defination1(time_var)

    for ii=1:length(time_var)   % need a index variable to check conditon at individual time

        if time_var(ii)< -5
            op_signal(ii)=0;
        elseif -5<=time_var(ii) & time_var(ii)<0
            op_signal(ii)=5;
        elseif 0<=time_var(ii) & time_var(ii)<5
            op_signal(ii)=10;
        else
            op_signal(ii)=0;
        end
        
    end

end