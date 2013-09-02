%载入数据，其中A在左上角，B在右下角
load hangshisu.txt;
load lieshisu.txt;

%时间最短
hangshijian=100./hangshisu;
lieshijian=100./lieshisu;
state_t=zeros(19,10);
state_t(1,1)=0;
path_t=zeros(19,10);
%求state(i,i)
for i=2:10
    state_t(i,i)=state_t(i-1,i-1)+hangshijian(1,i-1);
end
%求state(:,1)
for i=2:10
    state_t(i,1)=state_t(i-1,1)+lieshijian(i-1,1);
end

for i=2:10
    for j=2:i-1
        state_t(i,j)=min(state_t(i-1,j-1)+hangshijian(i+1-j,j-1),state_t(i-1,j)+lieshijian(i-j,j));
        if(state_t(i-1,j-1)+hangshijian(i+1-j,j-1) > state_t(i-1,j)+lieshijian(i-j,j))
            path_t(i,j)=1;
        else
            path_t(i,j)=-1;
        end
    end
end

for i=11:19
    for j=i-9:10
        state_t(i,j)=min(state_t(i-1,j-1)+hangshijian(i+1-j,j-1),state_t(i-1,j)+lieshijian(i-j,j));
        if(state_t(i-1,j-1)+hangshijian(i+1-j,j-1) > state_t(i-1,j)+lieshijian(i-j,j))
            path_t(i,j)=1;
        else
            path_t(i,j)=-1;
        end
    end
end

%费用
zuijiasudu=sqrt(500/0.0625/1.3);
feiyong_50=500/50+(0.0625*50+1.875)*1.3;
feiyong_78=500/zuijiasudu+(0.0625*zuijiasudu+1.875)*1.3;
hangfeiyong=ones(10,9)*feiyong_78;
hangfeiyong(find(hangshisu==50))=feiyong_50;
hangfeiyong(find(hangshisu==130))=feiyong_78+3;
liefeiyong=ones(9,10)*feiyong_78;
liefeiyong(find(lieshisu==50))=feiyong_50;
liefeiyong(find(lieshisu==130))=feiyong_78+3;


state_f=zeros(19,10);
state_f(1,1)=0;
path_f=zeros(19,10);
%求state(i,i)
for i=2:10
    state_f(i,i)=state_f(i-1,i-1)+hangfeiyong(1,i-1);
end
%求state(:,1)
for i=2:10
    state_f(i,1)=state_f(i-1,1)+liefeiyong(i-1,1);
end

for i=2:10
    for j=2:i-1
        state_f(i,j)=min(state_f(i-1,j-1)+hangfeiyong(i+1-j,j-1),state_f(i-1,j)+liefeiyong(i-j,j));
        if(state_f(i-1,j-1)+hangfeiyong(i+1-j,j-1) > state_f(i-1,j)+liefeiyong(i-j,j))
            path_f(i,j)=1;
        else
            path_f(i,j)=-1;
        end
    end
end

for i=11:19
    for j=i-9:10
        state_f(i,j)=min(state_f(i-1,j-1)+hangfeiyong(i+1-j,j-1),state_f(i-1,j)+liefeiyong(i-j,j));
        if(state_f(i-1,j-1)+hangfeiyong(i+1-j,j-1) > state_f(i-1,j)+liefeiyong(i-j,j))
            path_f(i,j)=1;
        else
            path_f(i,j)=-1;
        end
    end
end

    