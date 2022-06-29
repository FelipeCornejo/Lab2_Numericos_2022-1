function [lineales,cubicas,splines,rmse_lineal,rmse_cubica,rmse_spline] = aprox(data,x,v1,v2,v3,v4,tamanyo)


%Se realiza las ventanas para analizar si se puede realizar un analisis con
%curvas más limpias.
ajuste1 = 1:v1:tamanyo;
ajuste2 = 1:v2:tamanyo;
ajuste3 = 1:v3:tamanyo;
ajuste4 = 1:v4:tamanyo;

data1 = cut_info(data,ajuste1);
data2 = cut_info(data,ajuste2);
data3 = cut_info(data,ajuste3);
data4 = cut_info(data,ajuste4);

%Se interpolan los distintos ajustes de la curva con el método lineal
linealv1 = interp1(ajuste1,data1,x,"linear");
linealv2 = interp1(ajuste2,data2,x,"linear");
linealv3 = interp1(ajuste3,data3,x,"linear");
linealv4 = interp1(ajuste4,data4,x,"linear");

%Se interpolan los distintos ajustes de la curva con el método cubico
cubicav1 = interp1(ajuste1,data1,x,"cubic");
cubicav2 = interp1(ajuste2,data2,x,"cubic");
cubicav3 = interp1(ajuste3,data3,x,"cubic");
cubicav4 = interp1(ajuste4,data4,x,"cubic");

%Se interpolan los distintos ajustes de la curva con el método de splines
splinev1 = interp1(ajuste1,data1,x,"spline");
splinev2 = interp1(ajuste2,data2,x,"spline");
splinev3 = interp1(ajuste3,data3,x,"spline");
splinev4 = interp1(ajuste4,data4,x,"spline");

%Se guardan las interpolaciones en sus respectivos arrays
lineales = [ceil(linealv1);ceil(linealv2);ceil(linealv3);ceil(linealv4)];
cubicas = [ceil(cubicav1);ceil(cubicav2);ceil(cubicav3);ceil(cubicav4)];
splines = [ceil(splinev1);ceil(splinev2);ceil(splinev3);ceil(splinev4)];


%Se obtienen los errores RMSE de los datos interpolados de manera linelal
rmse_linealv1 = sqrt(mse(data-linealv1));
rmse_linealv2 = sqrt(mse(data-linealv2));
rmse_linealv3 = sqrt(mse(data-linealv3));
rmse_linealv4 = sqrt(mse(data-linealv4));

%Se obtienen los errores RMSE de los datos interpolados de manera cubica
rmse_cubicav1 = sqrt(mse(data-cubicav1));
rmse_cubicav2 = sqrt(mse(data-cubicav2));
rmse_cubicav3 = sqrt(mse(data-cubicav3));
rmse_cubicav4 = sqrt(mse(data-cubicav4));

%Se obtienen los errores RMSE de los datos interpolados de manera de
%splines
rmse_splinev1 = sqrt(mse(data-splinev1));
rmse_splinev2 = sqrt(mse(data-splinev2));
rmse_splinev3 = sqrt(mse(data-splinev3));
rmse_splinev4 = sqrt(mse(data-splinev4));

%Se guardan los errores RMSE en sus respectivos arrays
rmse_lineal = [rmse_linealv1;rmse_linealv2;rmse_linealv3;rmse_linealv4];
rmse_cubica = [rmse_cubicav1;rmse_cubicav2;rmse_cubicav3;rmse_cubicav4];
rmse_spline = [rmse_splinev1;rmse_splinev2;rmse_splinev3;rmse_splinev4];

end

