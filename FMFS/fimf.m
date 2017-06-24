function [res,time] = fimf( data, answer, f_count, l_count )

tic

fcol = size( data, 2 );
lcol = size( answer, 2 );
scr = -inf( fcol, 1 );

ent_f = zeros( fcol, 1 );
for k=1:fcol
    ent_f( k ) = b_entropy( data(:,k) );
end
f_rank = sortrows( [(1:fcol)',ent_f], -2 );
scr( f_rank(1:f_count,1) ) = 0;

ent_l = zeros( lcol, 1 );
for k=1:lcol
    ent_l( k ) = b_entropy( answer(:,k) );
end
l_rank = sortrows( [(1:lcol)',ent_l], -2 );

ent_fl = -inf( fcol, lcol );
for k=1:fcol
    if isinf( scr(k) )
        continue;
    else
        for m=1:lcol
            ent_fl(k,m) = b_entropy( [data(:,k),answer(:,m)] );
        end
    end
end
% fprintf( 'Entropy values H(f,l) obtained: %0.4f seconds\n', toc );

for k=1:fcol
    if isinf( scr(k) )
        continue;
    else
%       for m=1:lcol
%           scr(k) = scr(k) + ent_f(k) - ent_fl(k,m);
%       end
        scr(k) = scr(k) + ent_f(k) * lcol ...
            - sum( ent_fl(k,:) );

        for m=1:l_count
            for n=m+1:l_count
                scr(k) = scr(k) - ent_f(k) ...
                    + ent_fl(k,l_rank(m,1)) + ent_fl(k,l_rank(n,1)) ...
                    - b_entropy( [data(:,k),answer(:,l_rank(m,1)),answer(:,l_rank(n,1))] );
            end
        end
    end
end

res = [(1:fcol)',sum(scr,2)];
res = sortrows( res, -2 );
time = toc;



