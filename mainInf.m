clear
clc

load("INF.mat")

%Definicion de las distintas ventanas
ventana1 = 3;
ventana2 = 7;
ventana3 = 21;
ventana4 = 39;

%definición de eje x sobre el cual trabajar UCI_39
tamanyo = size(INF_T);
tamanyo = tamanyo(2);
x = 1:1:tamanyo;

INF_T_CONV = ceil(conv(INF_T, [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]/29));
tamanyo_conv = size(INF_T_CONV);
tamanyo_conv = tamanyo_conv(2);
x_conv = 1:1:tamanyo_conv;

error_conv = sum(INF_T)-sum(INF_T_CONV);
porcentaje_error_conv = (error_conv/sum(INF_T))*100;

[liniales_INF_T,cubicas_INF_T,splines_INF_T,rnmse_lineal_INF_T,rmse_cubica_INF_T,rmse_spline_INF_T] = aprox(INF_T_CONV,x_conv,ventana1,ventana2,ventana3,ventana4,tamanyo_conv);

figure
plot(x_conv,INF_T_CONV,x_conv,liniales_INF_T(1,:),x_conv,liniales_INF_T(2,:),x_conv,liniales_INF_T(3,:),x_conv,liniales_INF_T(4,:),'-');

figure
plot(x_conv,INF_T_CONV,x_conv,cubicas_INF_T(1,:),x_conv,cubicas_INF_T(2,:),x_conv,cubicas_INF_T(3,:),x_conv,cubicas_INF_T(4,:),'-');

figure
plot(x_conv,INF_T_CONV,x_conv,splines_INF_T(1,:),x_conv,splines_INF_T(2,:),x_conv,splines_INF_T(3,:),x_conv,splines_INF_T(4,:),'-');

%INTEGRAL PARA INF_T con ventanas de 30 días
int_L_INF_T = ceil(trapz(liniales_INF_T(4,:)));
int_C_INF_T = ceil(trapz(cubicas_INF_T(4,:)));
int_S_INF_T = ceil(trapz(splines_INF_T(4,:)));

%definición de eje x sobre el cual trabajar UCIC_39
tamanyoC = size(INFC_T);
tamanyoC = tamanyoC(2);
x = 1:1:tamanyoC;

INFC_T_CONV = ceil(conv(INFC_T, [1 1 1 1 1 1 1 1 1 1 1 1 1 1]/14));
tamanyo_conv = size(INFC_T_CONV);
tamanyo_conv = tamanyo_conv(2);
x_conv = 1:1:tamanyo_conv;

[liniales_INFC_T,cubicas_INFC_T,splines_INFC_T,rnmse_lineal_INFC_T,rmse_cubica_INFC_T,rmse_spline_INFC_T] = aprox(INFC_T_CONV,x_conv,ventana1,ventana2,ventana3,ventana4,tamanyo_conv);

% figure
% plot(x_conv,INFC_T_CONV,x_conv,liniales_INFC_T(1,:),x_conv,liniales_INFC_T(2,:),x_conv,liniales_INFC_T(3,:),x_conv,liniales_INFC_T(4,:),'-');
% figure
% plot(x_conv,INFC_T_CONV,x_conv,cubicas_INFC_T(1,:),x_conv,cubicas_INFC_T(2,:),x_conv,cubicas_INFC_T(3,:),x_conv,cubicas_INFC_T(4,:),'-');
% figure
% plot(x_conv,INFC_T_CONV,x_conv,splines_INFC_T(1,:),x_conv,splines_INFC_T(2,:),x_conv,splines_INFC_T(3,:),x_conv,splines_INFC_T(4,:),'-');

figure
plot(x_conv,INFC_T_CONV,'-');
hold on
plot(x_conv,liniales_INFC_T(2,:),'-');
hold on
% plot(x_conv,liniales_INFC_T(3,:),'-');
% hold off

figure
plot(x_conv,INFC_T_CONV,'-');
hold on
plot(x_conv,cubicas_INFC_T(2,:),'-');
hold on
% plot(x_conv,cubicas_INFC_T(3,:),'-');
% hold off

figure
plot(x_conv,INFC_T_CONV,'-');
hold on
plot(x_conv,splines_INFC_T(2,:),'-');
hold on
% plot(x_conv,splines_INFC_T(3,:),'-');
% hold off

%INTEGRALES INFC_T con ventana de 7 días
int_L_INFC_T = ceil(trapz(liniales_INFC_T(2,:)));
int_C_INFC_T = ceil(trapz(cubicas_INFC_T(2,:)));
int_S_INFC_T = ceil(trapz(splines_INFC_T(2,:)));

error_int_L_INFC_T = sum(INFC_T(1,:)) - int_L_INFC_T;
error_int_C_INFC_T = sum(INFC_T(1,:)) - int_C_INFC_T;
error_int_S_INFC_T = sum(INFC_T(1,:)) - int_S_INFC_T;

suma_INFC_T = sum(INFC_T);
porcentaje_error_int_L_INFC_T = (error_int_L_INFC_T/suma_INFC_T)*100;
porcentaje_error_int_C_INFC_T = (error_int_C_INFC_T/suma_INFC_T)*100;
porcentaje_error_int_S_INFC_T = (error_int_S_INFC_T/suma_INFC_T)*100;