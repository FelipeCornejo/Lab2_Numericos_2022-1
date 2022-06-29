clear
clc

load("data_edades.mat")



%Definicion de las distintas ventanas
ventana1 = 2;
ventana2 = 7;
ventana3 = 15;
ventana4 = 30;

%definición de eje x sobre el cual trabajar UCI_39
tamanyo = size(UCI39);
tamanyo = tamanyo(2);
x = 1:1:tamanyo;

[liniales_UCI39,cubicas_UCI39,splines_UCI39,rnmse_lineal_UCI39,rmse_cubica_UCI39,rmse_spline_UCI39] = aprox(UCI39,x,ventana1,ventana2,ventana3,ventana4,tamanyo);

figure
plot(x,UCI39,x,liniales_UCI39(1,:),x,liniales_UCI39(2,:),x,liniales_UCI39(3,:),x,liniales_UCI39(4,:),'-');

figure
plot(x,UCI39,x,cubicas_UCI39(1,:),x,cubicas_UCI39(2,:),x,cubicas_UCI39(3,:),x,cubicas_UCI39(4,:),'-');

figure
plot(x,UCI39,x,splines_UCI39(1,:),x,splines_UCI39(2,:),x,splines_UCI39(3,:),x,splines_UCI39(4,:),'-');

%definición de eje x sobre el cual trabajar UCIC_39
tamanyoC = size(UCIC39);
tamanyoC = tamanyoC(2);
x = 1:1:tamanyoC;

[liniales_UCIC39,cubicas_UCIC39,splines_UCIC39,rnmse_lineal_UCIC39,rmse_cubica_UCIC39,rmse_spline_UCIC39] = aprox(UCIC39,x,ventana1,ventana2,ventana3,ventana4,tamanyoC);

figure
plot(x,UCIC39,x,liniales_UCIC39(1,:),x,liniales_UCIC39(2,:),x,liniales_UCIC39(3,:),x,liniales_UCIC39(4,:),'-');

figure
plot(x,UCIC39,x,cubicas_UCIC39(1,:),x,cubicas_UCIC39(2,:),x,cubicas_UCIC39(3,:),x,cubicas_UCIC39(4,:),'-');

figure
plot(x,UCIC39,x,splines_UCIC39(1,:),x,splines_UCIC39(2,:),x,splines_UCIC39(3,:),x,splines_UCIC39(4,:),'-');

