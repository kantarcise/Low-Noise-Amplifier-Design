% Adjust x and y according to the transistor that you select.

x = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

y = [ .987  .965 .925 .878  .828 .776  .719  .669  .631 .590 .548 .507 .482  .459 .439 .419  .404 .383 .377  .348 ];
    
plot(s21Magnitude, 'y');
xlim([0 21]);
title('S11 Magnitude Curve')
legend("S11 Magnitude");
xlabel('Frequency (GHz)', 'FontSize',10,'FontWeight','bold','Color','b')
ylabel('Magnitude', 'FontSize',10,'FontWeight','bold','Color','b')

Results=zeros(1,200);

for counter = 10:200
    
   Results(counter-9) = s21Magnitude(counter/10);
    
end

Temp = transpose(Results);
dlmwrite('S21Magnitude.txt',Temp);

