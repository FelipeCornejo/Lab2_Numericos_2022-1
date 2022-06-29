clear
clc

load("UCI_Totales.mat")



%Definicion de las distintas ventanas
ventana1 = 3;
ventana2 = 7;
ventana3 = 21;
ventana4 = 39;

%definición de eje x sobre el cual trabajar UCI_39
tamanyo = size(UCI_T);
tamanyo = tamanyo(2);
x = 1:1:tamanyo;

UCI_T_CONV = ceil(conv(UCI_T, [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]/29));
tamanyo_conv = size(UCI_T_CONV);
tamanyo_conv = tamanyo_conv(2);
x_conv = 1:1:tamanyo_conv;

error_conv = sum(UCI_T)-sum(UCI_T_CONV);
porcentaje_error_conv = (error_conv/sum(UCI_T))*100;

[liniales_UCI_T,cubicas_UCI_T,splines_UCI_T,rnmse_lineal_UCI_T,rmse_cubica_UCI_T,rmse_spline_UCI_T] = aprox(UCI_T_CONV,x_conv,ventana1,ventana2,ventana3,ventana4,tamanyo_conv);

figure
plot(x_conv,UCI_T_CONV,x_conv,liniales_UCI_T(1,:),x_conv,liniales_UCI_T(2,:),x_conv,liniales_UCI_T(3,:),x_conv,liniales_UCI_T(4,:),'-');

figure
plot(x_conv,UCI_T_CONV,x_conv,cubicas_UCI_T(1,:),x_conv,cubicas_UCI_T(2,:),x_conv,cubicas_UCI_T(3,:),x_conv,cubicas_UCI_T(4,:),'-');

figure
plot(x_conv,UCI_T_CONV,x_conv,splines_UCI_T(1,:),x_conv,splines_UCI_T(2,:),x_conv,splines_UCI_T(3,:),x_conv,splines_UCI_T(4,:),'-');



%Definicion de las distintas ventanas
ventana1 = 2;
ventana2 = 7;
ventana3 = 14;

%definición de eje x sobre el cual trabajar UCIC_39
tamanyoC = size(UCIC_T);
tamanyoC = tamanyoC(2);
x = 1:1:tamanyoC;


UCIC_T_CONV = ceil(conv(UCIC_T, [1 1 1 1 1 1 1]/7));
tamanyo_conv = size(UCIC_T_CONV);
tamanyo_conv = tamanyo_conv(2);
x_conv = 1:1:tamanyo_conv;

error_conv_clases = sum(UCIC_T)-sum(UCIC_T_CONV);
porcentaje_error_conv = (error_conv/sum(UCI_T))*100;

%NO VALE LA PENA APLICAR CONVOLUCIÓN PARA TAN POCOS DATOS, el error fue de
%-894592 personas

[liniales_UCIC_T,cubicas_UCIC_T,splines_UCIC_T,rnmse_lineal_UCIC_T,rmse_cubica_UCIC_T,rmse_spline_UCIC_T] = aprox(UCIC_T_CONV,x_conv,ventana1,ventana2,ventana3,ventana4,tamanyo_conv);

figure
plot(x_conv,UCIC_T_CONV,x_conv,liniales_UCIC_T(1,:),x_conv,liniales_UCIC_T(2,:),x_conv,liniales_UCIC_T(3,:),x_conv,liniales_UCIC_T(4,:),'-');

figure
plot(x_conv,UCIC_T_CONV,x_conv,cubicas_UCIC_T(1,:),x_conv,cubicas_UCIC_T(2,:),x_conv,cubicas_UCIC_T(3,:),x_conv,cubicas_UCIC_T(4,:),'-');

figure
plot(x_conv,UCIC_T_CONV,x_conv,splines_UCIC_T(1,:),x_conv,splines_UCIC_T(2,:),x_conv,splines_UCIC_T(3,:),x_conv,splines_UCIC_T(4,:),'-');

%INTEGRALES UCIC_T con ventana de 7 días
int_L_UCIC_T = ceil(trapz(liniales_UCIC_T(2,:)));
int_C_UCIC_T = ceil(trapz(cubicas_UCIC_T(2,:)));
int_S_UCIC_T = ceil(trapz(splines_UCIC_T(2,:)));

error_int_L_UCIC_T = sum(UCIC_T(1,:)) - int_L_UCIC_T;
error_int_C_UCIC_T = sum(UCIC_T(1,:)) - int_C_UCIC_T;
error_int_S_UCIC_T = sum(UCIC_T(1,:)) - int_S_UCIC_T;

suma_UCIC_T = sum(UCIC_T);
porcentaje_error_int_L_UCIC_T = (error_int_L_UCIC_T/suma_UCIC_T)*100;
porcentaje_error_int_C_UCIC_T = (error_int_C_UCIC_T/suma_UCIC_T)*100;
porcentaje_error_int_S_UCIC_T = (error_int_S_UCIC_T/suma_UCIC_T)*100;