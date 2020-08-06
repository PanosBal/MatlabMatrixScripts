function P = mask_band(n,type,p,q)
if ~exist('q','var')
     % q parameter does not exist, so q=p
      q = p;
end

if type=='band'
    P=ones(n,n);
    for i=1:n
        for j=1:n
            if (j<i-q) P(i,j)=0;
            end
            if(j>i+p)  P(i,j)=0;
            end
        end
    end
end


if type=='btdr'
    %create tridiagonial matrix
    p_temp=1;
    a=ones(n,n);
    for i=1:n
        for j=1:n
            if (j<i-p_temp) a(i,j)=0;
            end
            if(j>i+p_temp)  a(i,j)=0;
            end
        end
    end
    c=ones(p)
    full(a)
    x=kron(a,c);
    P = x(1:n, 1:n)%I get the right dimensions cause the kron matrix is bigger
end

end
