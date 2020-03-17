%Matlab code to model average consensus of distributed multiagent system


%Adjacency matrix of the graph
Adj=[0 1 0 0; 1 0 1 0; 0 1 0 1; 1 0 1 0]; 
G=digraph(Adj);
plot(G);
title('Directed Graph Representation');

n=length(Adj);
x=[1,4,2,6];
xdot=zeros(1,n);
dt=0.1;
count=zeros(1,n);
time=10;

%Distributed Average Consensus
for t=0:dt:time
    for i=1:n
        for j=1:n
            xdot(i)=Adj(i,j)*(x(j)-x(i)); %average consensus law
            x(i)=x(i)+xdot(i)*dt;  
        end
        count(i) = count(i)+1;
        xarray(count(i),i)=x(i);
    end
end
figure;
t=0:dt:time;
plot(t,xarray);
legend('agent 1', 'agent 2', 'agent 3', 'agent 4');
title('Distrubited Multi-Agent Average Consensus');
xlabel('time (s)');
ylabel('x(t)');

