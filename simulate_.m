%�������ʱÿ��·�Լ۱ȣ�����ȷ��һ��·�����Լ۱���ߵ�·��ʼ���٣�ֱ��ʱ��ﵽ0.8TΪֹ����¼����F0
%�ı�·�ߣ����Լ۱���ߵ�·��ʼ���٣�ֱ����ʡ��ʱ��ﵽ[3.55617715617716](0.2T)Ϊֹ����¼���ú�F0�Ƚ�
%����ʱÿ��·�Լ۱ȣ����ֳ��ٷ�������·  
%�Լ۱�=��ʡ��ʱ��/���ӵķ���
%nΪ���ȱ���1.1��1.5
%���ӵķ���=(500/(n*v)+(0.0625*n*v+1.875)/1.3+��������)-(500/v+(0.0625v+1.875)/1.3)������·�Ѳ���,��Ϊ���������ˣ�
%����������10%��=1/9*0.7*100+1/81*(1-0.3*0.3)*100=8.90123456790123
%����������50%��=1/9*0.9*200+1/81*(1-0.1*0.1)*200=22.4444444444444
%��ɫ�ضη���������10%��=1*0.7*100+1/9*(1-0.3*0.3)*100+1/81*(1-0.3*0.3*0.3)*100=11.3123456790123
%��ɫ�ضη���������50%��=1*0.9*200+1/9*(1-0.1*0.1)*200+1/81*(1-0.1*0.1*0.1)*200=24.4666666666667
kinds=[50 90 110 130 50 90 130];
fajin_10=1/9*0.7*100+1/81*(1-0.3*0.3)*100;
fajin_50=1/9*0.9*200+1/81*(1-0.1*0.1)*200;
fajin_hong_10=1*0.7*100+1/9*(1-0.3*0.3)*100+1/81*(1-0.3*0.3*0.3)*100;
fajin_hong_50=1*0.9*200+1/9*(1-0.1*0.1)*200+1/81*(1-0.1*0.1*0.1)*200;
fajinqiwang=[fajin_10 fajin_10 fajin_10 fajin_10 fajin_hong_10 fajin_hong_10 fajin_hong_10
             fajin_50 fajin_50 fajin_50 fajin_50 fajin_hong_50 fajin_hong_50 fajin_hong_50];
         
xingjiabi=zeros(2,7);
yuanshijian=100./kinds;
jieshenshijian(1,:)=100./kinds-100./(kinds.*1.1);
jieshenshijian(2,:)=100./kinds-100./(kinds.*1.5);
zengjiafeiyong(1,:)=(500./(1.1*kinds)+(0.0625*1.1.*kinds+1.875)/1.3+fajinqiwang(1,:))-(500./kinds+(0.0625.*kinds+1.875)/1.3);
zengjiafeiyong(2,:)=(500./(1.5*kinds)+(0.0625*1.5.*kinds+1.875)/1.3+fajinqiwang(2,:))-(500./kinds+(0.0625.*kinds+1.875)/1.3);
xingjiabi=jieshenshijian./zengjiafeiyong;

%���һ�����ٵ�·��Ҫѡ��10%����50%


lieshisutemp=lieshisu;
hangshisutemp=hangshisu;
lieshisutemp(1,3)=132;lieshisutemp(3,2)=132;lieshisutemp(3,8)=131;lieshisutemp(3,10)=133;lieshisutemp(4,6)=132;
lieshisutemp(5,2)=132;lieshisutemp(6,4)=132;lieshisutemp(6,10)=131;lieshisutemp(9,1)=132;lieshisutemp(9,6)=132;
hangshisutemp(1,4)=133;hangshisutemp(2,9)=131;hangshisutemp(3,3)=132;hangshisutemp(4,6)=132;hangshisutemp(5,4)=132;
hangshisutemp(6,1)=132;hangshisutemp(7,5)=131;hangshisutemp(8,5)=132;hangshisutemp(9,1)=132;hangshisutemp(10,8)=132;


path_sa0=[0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1];%0����1��
path_sa1=[0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1];%0����1��
e=0.1^30;L=200000000;at=0.9999;T=1;
savetiemtemp=jieshenshijian(2,:);%[0.666666666666667,0.370370370370370,0.303030303030303,0.256410256410257,0.666666666666667,0.370370370370370,0.256410256410257];

money0=99999;
money1=0;
%moneytemp=500./[50 50 90 90 110 130 130]+(0.0625.*[50 50 90 90 110 130 130]+1.875).*1.3+[20.3130341880342,22.3352564102564,22.7560541310541,24.7782763532763,23.5735236985237,24.2873931623932,26.3096153846154];
moneytemp=500./[50 90 110 130 50 90 130]+(0.0625.*[50 90 110 130 50 90 130]+1.875).*1.3+zengjiafeiyong(2,:)+[0 0 0 3 0 0 3];%[20.3130341880342,22.7560541310541,23.5735236985237,24.2873931623932,202.335256410256,204.778276353276,206.309615384615]+[0 0 0 3 0 0 3];
moneyyuan=500./[50 90 110 130 50 90 130]+(0.0625.*[50 90 110 130 50 90 130]+1.875).*1.3+[0 0 0 3 0 0 3];
%�˻����
for l=1:L
    path_sa1=path_sa0;
    if rand>0.5 %��һ��path_sa��0/1��λ��
        zero=find(path_sa1==0);
        one=find(path_sa1);
        path_sa1(zero(ceil(rand*9)))=1;
        path_sa1(one(ceil(rand*9)))=0;
        
    else %������
        zero=find(path_sa1==0);
        one=find(path_sa1);
        path_sa1(zero(ceil(rand*9)))=1;
        path_sa1(one(ceil(rand*9)))=0;
        
        zero=find(path_sa1==0);
        one=find(path_sa1);
        path_sa1(zero(ceil(rand*9)))=1;
        path_sa1(one(ceil(rand*9)))=0;
        
    end
    
    %����ָ��·���µ���ѳ��ٷ���
    zongshijian=0;
    i=1;j=1;
    for k=1:18
        if(path_sa1(k)==0)
            shisutemp(k)=lieshisutemp(i,j);
            zongshijian=zongshijian+lieshijian(i,j);
            i=i+1;
        else
            shisutemp(k)=hangshisutemp(i,j);
            zongshijian=zongshijian+hangshijian(i,j);
            j=j+1;
        end
        switch shisutemp(k)
            case 50
                kindtemp(k)=1;
            case 90
                kindtemp(k)=2;
            case 110
                kindtemp(k)=3;
            case 130
                kindtemp(k)=4;
            case 131
                kindtemp(k)=5;
            case 132
                kindtemp(k)=6;
            case 133
                kindtemp(k)=7;
        end
       %shijiantemp
       %feiyongtemp
    end
    
    kindtemp_sort=sort(kindtemp);
    savetime=0;money1=0;
    goal=zongshijian-state_t(19,10)*0.8;
    for k=1:18
        savetime=savetime+savetiemtemp(kindtemp_sort(k));
        money1=money1+moneytemp(kindtemp_sort(k));
        if(savetime>=goal)
            break;
        end
    end
    for kk=k:18
        money1=money1+moneyyuan(kindtemp_sort(k));
    end
    
    if(money1<money0)%�·����С�������½��
        money0=money1;
        path_sa0=path_sa1;
        chaosucishu=k;
        kind=kindtemp;
        time=[savetime,goal];
    elseif(exp((money0-money1)/T)>rand)%�·���ϴ���һ�����ʽ����½��
        money0=money1;
        path_sa0=path_sa1;
        chaosucishu=k;
        kind=kindtemp;
        time=[savetime,goal];
    end

    T=T*at;
    if T<e
        break;
    end
end




