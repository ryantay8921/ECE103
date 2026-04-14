function [z1, z2] = add_sub(x,y)
   
    if x<0
       z1 = x + y;
       z2 = x - y;
    else 
       z1 = x - y;
       z2 = x + y;
    end
    
end