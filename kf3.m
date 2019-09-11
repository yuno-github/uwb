%カルマンの推定値と外れてる場合除去
function [xhat_new,P_new,G,trigger]=kf3(A,B,Bu,C,Q,R,u,y,xhat,P,th,trigger)

    xhat=xhat(:);
    u=u(:);
    y=y(:);
    
    xhatm=A*xhat+Bu*u;
    if trigger==0
    if norm(y-C'*xhatm)>th
        y=xhatm(1:2);
        trigger=1;
    end
    else
        if trigger==1
        trigger=0;
        end
%         if trigger==3
%         trigger=4;
%         end
%         if trigger==2
%             trigger=3;
%         end
%         if trigger==1
%             trigger=2;
%         end
%         if trigger<=1 && trigger>=1
%             trigger=trigger+1;
%         end
    end
    

    
    Pm=A*P*A'+B*Q*B';
    
    G=Pm*C/(C'*Pm*C+R);
    
    xhat_new=xhatm+G*(y-C'*xhatm);
    P_new=(eye(size(A))-G*C')*Pm;
end