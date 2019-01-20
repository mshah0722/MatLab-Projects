% First, I loaded the ECG files to workspace using the load function  
load (ecg1.mat); load (ecg2.mat); load (ecg3.mat)

% Now, I need to plot the time against the ECG values for each patient
% Below are the calculations for the first patient
plot (time1, ecg1);
% This for loop plots the five major point annotations for each heartbeat
for i=1:5
    mark1=find(marker1==i);
    hold on;
    plot (time1(mark1), ecg1(mark1), ".");
end
title ("Electrical Activity of Patient 1");
xlabel ("Time (seconds)");
ylabel ("Voltage (mV)");
grid on;

figure;
plot (time1, ecg1);
xlim ([0,6]);

R=find(marker1==3);
count=length(R);
AverageBPMofPatient1 = length(R)/time1(end)*60;
% The average heartbeats per minute of patient one is 136.58 which is a higher bpm than the normal range of 60-100 bpm
% The patient has tachycardia

% I used the P and R peaks and subtracted them from one another
% I set that value to total PR (tPR1) and summed all values and divided by the length of tPR to get the average PR length (avgtPR1)
tP1=find(marker1==1);
tR1=find(marker1==3);
tP1(293)=[];
% The data includes an extra P wave peak with not R wave peak. This why this value was removed from the data
tPR1=time1(tR1)-time1(tP1);
sum1=0;
for j=1:1:length(tPR1)
    sum1=sum1+tPR1(j);
end
avgtPR1=sum1/length(tPR1);
% The average PR interval (avgtPR1) = 0.1054 seconds
% This is below the 0.12 to 0.20 s average PR range
% This indicates that the patient might have Wolff-Parkinson-White syndrome or Lown-Ganong-Levine syndrome


% Now, I will do the calculations for the second patient
figure;
plot (time2, ecg2);
for k=1:5
    mark2=find(marker2==k);
    hold on;
    plot (time2(mark2), ecg2(mark2), ".");
end
title ("Electrical Activity of Patient 2");
xlabel ("Time (seconds)");
ylabel ("Voltage (mV)");
grid on;

figure;
plot (time2, ecg2);
xlim ([0,6]);

S=find(marker2==3);
count=length(S);
AverageBPMofPatient2 = length(S)/time2(end)*60;
% The average heartbeats per minute of patient two is 67.03
% The patient has a normal bpm that is within the range of 60-100bpm

tP2=find(marker2==1);
tR2=find(marker2==3);
tPR2=time2(tR2)-time2(tP2);
sum2=0;
for l=1:1:length(tPR2)
    sum2=sum2+tPR2(l);
end
avgtPR2=sum2/length(tPR2);
% The average PR interval (avgtPR2) = 0.1794 seconds
% This is between the 0.12 to 0.20 s average PR range
% Overall this is a healthy patient

% Now, I will do the calculations for the third patient
figure; plot (time3, ecg3);
for m=1:5
    mark3=find(marker3==m);
    hold on;
    plot (time3(mark3), ecg3(mark3), ".");
end
title ("Electrical Activity of Patient 3");
xlabel ("Time (seconds)");
ylabel ("Voltage (mV)");
grid on;

figure;
plot (time3, ecg3);
xlim ([0,6]);

T=find(marker3==3);
count=length(T);
AverageBPMofPatient3 = length(T)/time3(end)*60;
% The average heartbeats per minute of patient three is 43.03
% The patient has a lower bpm that is below the range of 60-100bpm
% The patient has a bradycardic heartbeat

tP3=find(marker3==1);
tR3=find(marker3==3);
tPR3=time3(tR3)-time3(tP3);
sum3=0;
for n=1:1:length(tPR3)
    sum3=sum3+tPR3(n);
end
avgtPR3=sum3/length(tPR3);
% The average PR interval (avgtPR3) = 0.2504 seconds
% This is above the 0.12 to 0.20 s average PR range
% This patient might have first degree heart block and 'trifasicular' block

