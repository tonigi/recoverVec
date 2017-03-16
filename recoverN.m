% Experiment: given the distance matrix m2 and the dimension d, is it possible to recover the vectors which yield it? Or maybe this was not the question...

function [a,b]=recoverN(m2,d)
    [N,M]=size(m2);

    fun=@(p) ssq(minime(p,m2));
 
    p1=ones(d*(N+M),1);
    [pe,res1]=patternsearch(fun,p1);
    fprintf('Residual: %f\n',res1);
    
    a=pe(1:(N*d));
    b=pe((N*d+1):end);
end

 
function of=ssq(v)
    of=sum(v.^2);
end

function of=minime(p,mref)
    l=length(p)/2;
    a=p(1:l);
    b=p((l+1):end);
    m2=edist(a,b);
    tmp=m2-mref;
    of=tmp(:);
end

function m2=edist(a,b)
    N=length(a);
    u=ones(N,1);
    m=a*u'-u*b';
    m2=m.^2;
end

