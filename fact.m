function y = fact(n)
    if((n > 0))
        y = n*fact(n-1);
    elseif((n == 0))
        y = 1;
    else
       disp("write a valid value")
       y = '';
    end
end