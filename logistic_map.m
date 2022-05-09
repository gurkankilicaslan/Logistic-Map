clear
N = 10000;
M = 100;
x = rand(N,M);
mu = repmat(linspace(0,1,N)',1,M);
for i = 1:1000
    plot(mu(:,1),x,'r');
    for t = 1 : 1000
        x = mu.*sin(pi.*x);
    end
    set(gca,'FontSize',15);
    xlabel('\mu');
    ylabel('x');
    drawnow;
end



clear
N = 1001;
M = 1001;
x = rand(N,M);
muc = 3.5699456;
dmu = exp(linspace(-0.075,0,N)');
mu = repmat(muc-dmu,1,M);
L = zeros(N,M);
nL = 1;

for t = 1 : 1000
    x = mu.*sin(pi.*x);
    nL = nL + 1;
    L = L + log(abs(pi.*mu.*cos(pi.*x)));
end
figure(2)
plot(-log(dmu),sum(L,2)/M/nL);


clear
N = 1001;
x = rand(N,1);
muc = 3.5699456;
dr = exp(linspace(-0.0398,-0.0396,N)');
mu = muc-dmu;
L = zeros(N,1);
T = 10^3;
for t = 1 : T
    x = mu.*sin(pi.*x);
    L = L + log(abs(pi.*mu.*cos(pi.*x)));
end
figure(3)
plot(-log(dmu),L/T,'b.-');
result = (exp(-0.03815)-exp(-0.02869))/(exp(-0.04023)-exp(-0.038091));
result